import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/repositories/sync_repository.dart';
import '../database/app_database.dart';
import '../datasources/local_asset_datasource.dart';
import '../datasources/open_trivia_datasource.dart';
import '../datasources/static_remote_datasource.dart';

class SyncRepositoryImpl implements SyncRepository {
  final AppDatabase _db;
  final LocalAssetDataSource _localAssets;
  final StaticRemoteDataSource _remoteSource;
  final OpenTriviaDataSource _openTriviaSource;
  final SharedPreferences _prefs;

  SyncRepositoryImpl({
    required AppDatabase db,
    required LocalAssetDataSource localAssets,
    required StaticRemoteDataSource remoteSource,
    required SharedPreferences prefs,
    OpenTriviaDataSource? openTriviaSource,
  })  : _db = db,
        _localAssets = localAssets,
        _remoteSource = remoteSource,
        _prefs = prefs,
        _openTriviaSource = openTriviaSource ?? OpenTriviaDataSource();


  @override
  Future<void> seedInitialQuestionsIfEmpty() async {
    final countExp = _db.questions.id.count();
    final query = _db.selectOnly(_db.questions)..addColumns([countExp]);
    final result = await query.getSingle();
    final count = result.read(countExp) ?? 0;

    // Seed predefined subjects catalog into DB if needed
    final subjectCountExp = _db.subjects.id.count();
    final subQueryResult = await (_db.selectOnly(_db.subjects)..addColumns([subjectCountExp])).getSingle();
    final subCount = subQueryResult.read(subjectCountExp) ?? 0;
    if (subCount == 0) {
      await _db.batch((batch) {
        final entries = SubjectConfig.predefinedSubjects.asMap().entries.map((e) {
          final index = e.key;
          final s = e.value;
          return SubjectsCompanion.insert(
            id: s.id,
            name: s.name,
            description: s.description,
            iconName: s.id,
            displayOrder: index,
          );
        }).toList();
        batch.insertAllOnConflictUpdate(_db.subjects, entries);
      });
    }

    if (count > 0) {
      return; // Already seeded
    }

    try {
      final manifest = await _localAssets.loadBundledManifest();

      for (final pack in manifest.packs) {
        try {
          final dtos = await _localAssets.loadBundledPack(pack.subject);

          await _db.batch((batch) {
            final questionEntries = dtos.map((dto) {
              return QuestionsCompanion.insert(
                id: dto.id,
                subjectId: dto.subjectId,
                language: dto.language,
                ageGroup: dto.ageGroup,
                difficulty: dto.difficulty,
                questionText: dto.questionText,
                optionsJson: jsonEncode(dto.options),
                correctOptionIndex: dto.correctOptionIndex,
                explanation: dto.explanation,
                category: dto.category,
                source: dto.source,
                packVersion: Value(dto.packVersion),
                createdAt: dto.createdAt,
                updatedAt: dto.updatedAt,
              );
            }).toList();

            batch.insertAllOnConflictUpdate(_db.questions, questionEntries);

            batch.insert(
              _db.questionPacks,
              QuestionPacksCompanion.insert(
                id: pack.id,
                subjectId: pack.subject,
                version: pack.version,
                questionCount: dtos.length,
                checksum: Value(pack.sha256),
                syncedAt: DateTime.now(),
              ),
              mode: InsertMode.insertOrReplace,
            );
          });
        } catch (_) {
          // If a particular subject pack fails to seed, continue with others
          // to ensure maximum offline availability
        }
      }

      // Record local manifest version
      await _db.into(_db.syncMetadata).insertOnConflictUpdate(
            SyncMetadataCompanion.insert(
              key: 'manifest_version',
              value: manifest.version.toString(),
              updatedAt: DateTime.now(),
            ),
          );

      await _db.into(_db.syncMetadata).insertOnConflictUpdate(
            SyncMetadataCompanion.insert(
              key: 'last_sync_time',
              value: DateTime.now().toIso8601String(),
              updatedAt: DateTime.now(),
            ),
          );
    } catch (_) {
      // Offline fallback: keep what exists
    }
  }

  @override
  Future<SyncResult> syncWithRemote({String? customBaseUrl}) async {
    final baseUrl = customBaseUrl ??
        _prefs.getString(AppConstants.prefKeyRemoteBaseUrl) ??
        AppConstants.defaultRemoteBaseUrl;

    try {
      final remoteManifest = await _remoteSource.fetchRemoteManifest(baseUrl);
      final localVersion = await getLocalManifestVersion();

      if (remoteManifest.version <= localVersion) {
        return SyncResult.success(packsUpdated: 0, questionsUpdated: 0);
      }

      int packsUpdated = 0;
      int questionsUpdated = 0;

      for (final packMeta in remoteManifest.packs) {
        // Check local pack version
        final localPackQuery = _db.select(_db.questionPacks)
          ..where((tbl) => tbl.id.equals(packMeta.id));
        final localPack = await localPackQuery.getSingleOrNull();

        if (localPack == null || packMeta.version > localPack.version) {
          try {
            // Download, validate checksum and JSON schema
            final dtos = await _remoteSource.downloadAndValidatePack(
              packUrl: packMeta.url,
              expectedSha256: packMeta.sha256,
            );

            // Atomic database update
            await _db.batch((batch) {
              final questionEntries = dtos.map((dto) {
                return QuestionsCompanion.insert(
                  id: dto.id,
                  subjectId: dto.subjectId,
                  language: dto.language,
                  ageGroup: dto.ageGroup,
                  difficulty: dto.difficulty,
                  questionText: dto.questionText,
                  optionsJson: jsonEncode(dto.options),
                  correctOptionIndex: dto.correctOptionIndex,
                  explanation: dto.explanation,
                  category: dto.category,
                  source: dto.source,
                  packVersion: Value(dto.packVersion),
                  createdAt: dto.createdAt,
                  updatedAt: dto.updatedAt,
                );
              }).toList();

              batch.insertAllOnConflictUpdate(_db.questions, questionEntries);

              batch.insert(
                _db.questionPacks,
                QuestionPacksCompanion.insert(
                  id: packMeta.id,
                  subjectId: packMeta.subject,
                  version: packMeta.version,
                  questionCount: dtos.length,
                  checksum: Value(packMeta.sha256),
                  syncedAt: DateTime.now(),
                ),
                mode: InsertMode.insertOrReplace,
              );
            });

            packsUpdated++;
            questionsUpdated += dtos.length;
          } catch (_) {
            // If one pack fails validation or download, retain existing local data
            // and proceed with other packs safely
          }
        }
      }

      // Update sync metadata
      final now = DateTime.now();
      await _db.into(_db.syncMetadata).insertOnConflictUpdate(
            SyncMetadataCompanion.insert(
              key: 'manifest_version',
              value: remoteManifest.version.toString(),
              updatedAt: now,
            ),
          );

      await _db.into(_db.syncMetadata).insertOnConflictUpdate(
            SyncMetadataCompanion.insert(
              key: 'last_sync_time',
              value: now.toIso8601String(),
              updatedAt: now,
            ),
          );

      await _prefs.setString(
          AppConstants.prefKeyLastSyncTime, now.toIso8601String());

      return SyncResult.success(
        packsUpdated: packsUpdated,
        questionsUpdated: questionsUpdated,
      );
    } catch (e) {
      return SyncResult.failure(e.toString());
    }
  }

  @override
  Future<int> getLocalManifestVersion() async {
    final query = _db.select(_db.syncMetadata)
      ..where((tbl) => tbl.key.equals('manifest_version'));
    final row = await query.getSingleOrNull();
    if (row == null) return 0;
    return int.tryParse(row.value) ?? 0;
  }

  @override
  Future<DateTime?> getLastSyncTime() async {
    final query = _db.select(_db.syncMetadata)
      ..where((tbl) => tbl.key.equals('last_sync_time'));
    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return DateTime.tryParse(row.value);
  }

  @override
  Future<SyncResult> replenishSolvedQuestions({
    String? subjectId,
    String? ageGroup,
  }) async {
    final targetAge = ageGroup ??
        _prefs.getString(AppConstants.prefKeyUserAgeGroup) ??
        AppConstants.ageGroup8to10;

    final subjectsToProcess = subjectId != null
        ? [subjectId]
        : OpenTriviaDataSource.subjectToOpenTdbCategory.keys.toList();

    int totalQuestionsAdded = 0;
    int subjectsReplenished = 0;

    for (final sId in subjectsToProcess) {
      if (!_openTriviaSource.supportsSubject(sId)) continue;

      try {
        // 1. Check how many unsolved questions remain for this subject
        final answeredSubquery = _db.selectOnly(_db.quizAnswers)
          ..addColumns([_db.quizAnswers.questionId]);
        final countExp = _db.questions.id.count();
        final query = _db.selectOnly(_db.questions)
          ..addColumns([countExp])
          ..where(_db.questions.subjectId.equals(sId) &
              _db.questions.id.isNotInQuery(answeredSubquery));
        final row = await query.getSingle();
        final unsolvedCount = row.read(countExp) ?? 0;

        // If unsolved questions are running low (fewer than 20), fetch fresh ones
        if (unsolvedCount < 20) {
          final dtos = await _openTriviaSource.fetchFreshQuestions(
            subjectId: sId,
            ageGroup: targetAge,
            amount: 10,
          );

          if (dtos.isNotEmpty) {
            await _db.batch((batch) {
              final questionEntries = dtos.map((dto) {
                return QuestionsCompanion.insert(
                  id: dto.id,
                  subjectId: dto.subjectId,
                  language: dto.language,
                  ageGroup: dto.ageGroup,
                  difficulty: dto.difficulty,
                  questionText: dto.questionText,
                  optionsJson: jsonEncode(dto.options),
                  correctOptionIndex: dto.correctOptionIndex,
                  explanation: dto.explanation,
                  category: dto.category,
                  source: dto.source,
                  packVersion: Value(dto.packVersion),
                  createdAt: dto.createdAt,
                  updatedAt: dto.updatedAt,
                );
              }).toList();

              batch.insertAllOnConflictUpdate(_db.questions, questionEntries);
            });

            // Purge old solved questions for this subject to reclaim space and avoid clutter
            final deleteQuery = _db.delete(_db.questions)
              ..where((tbl) =>
                  tbl.subjectId.equals(sId) &
                  tbl.id.isInQuery(answeredSubquery));
            await deleteQuery.go();

            subjectsReplenished++;
            totalQuestionsAdded += dtos.length;
          }
        }
      } catch (_) {
        // Network or parsing error: continue with other subjects safely
      }
    }

    if (subjectsReplenished > 0) {
      final now = DateTime.now();
      await _prefs.setString(
          AppConstants.prefKeyLastSyncTime, now.toIso8601String());
      await _db.into(_db.syncMetadata).insertOnConflictUpdate(
            SyncMetadataCompanion.insert(
              key: 'last_sync_time',
              value: now.toIso8601String(),
              updatedAt: now,
            ),
          );
    }

    return SyncResult.success(
      packsUpdated: subjectsReplenished,
      questionsUpdated: totalQuestionsAdded,
    );
  }
}

