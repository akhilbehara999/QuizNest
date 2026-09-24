import 'dart:convert';
import 'package:drift/drift.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/question_repository.dart';
import '../database/app_database.dart';
import '../models/question_dto.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final AppDatabase _db;

  QuestionRepositoryImpl(this._db);

  @override
  Future<List<Question>> getQuestionsForQuiz({
    required String subjectId,
    required String ageGroup,
    int count = 10,
  }) async {
    // 1. Try to retrieve unsolved questions matching subject and age group
    final answeredSubquery = _db.selectOnly(_db.quizAnswers)
      ..addColumns([_db.quizAnswers.questionId]);

    final unsolvedQuery = _db.select(_db.questions)
      ..where((tbl) =>
          tbl.subjectId.equals(subjectId) &
          (tbl.ageGroup.equals(ageGroup) | tbl.ageGroup.equals('all')) &
          tbl.id.isNotInQuery(answeredSubquery))
      ..orderBy([(_) => OrderingTerm.random()])
      ..limit(count);

    var rows = await unsolvedQuery.get();

    // 2. If not enough unsolved questions in specific age group, check other age groups
    if (rows.length < count) {
      final needed = count - rows.length;
      final existingIds = rows.map((r) => r.id).toList();

      final broaderUnsolvedQuery = _db.select(_db.questions)
        ..where((tbl) =>
            tbl.subjectId.equals(subjectId) &
            tbl.id.isNotInQuery(answeredSubquery) &
            (existingIds.isNotEmpty ? tbl.id.isNotIn(existingIds) : const Constant(true)))
        ..orderBy([(_) => OrderingTerm.random()])
        ..limit(needed);

      final additionalRows = await broaderUnsolvedQuery.get();
      rows = [...rows, ...additionalRows];
    }

    // 3. Fallback: If user solved ALL questions in this subject, recycle from entire subject
    if (rows.length < count) {
      final needed = count - rows.length;
      final existingIds = rows.map((r) => r.id).toList();

      final fallbackQuery = _db.select(_db.questions)
        ..where((tbl) =>
            tbl.subjectId.equals(subjectId) &
            (existingIds.isNotEmpty ? tbl.id.isNotIn(existingIds) : const Constant(true)))
        ..orderBy([(_) => OrderingTerm.random()])
        ..limit(needed);

      final recycledRows = await fallbackQuery.get();
      rows = [...rows, ...recycledRows];
    }

    // Return questions with options dynamically shuffled so answer is randomized across A, B, C, D
    return rows
        .map((r) => QuestionDto.fromEntry(r).toDomain().withShuffledOptions())
        .toList();
  }

  @override
  Future<int> getQuestionCountForSubject(String subjectId) async {
    final countExp = _db.questions.id.count();
    final query = _db.selectOnly(_db.questions)
      ..addColumns([countExp])
      ..where(_db.questions.subjectId.equals(subjectId));
    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }

  @override
  Future<int> getUnsolvedQuestionCountForSubject(String subjectId) async {
    final answeredSubquery = _db.selectOnly(_db.quizAnswers)
      ..addColumns([_db.quizAnswers.questionId]);

    final countExp = _db.questions.id.count();
    final query = _db.selectOnly(_db.questions)
      ..addColumns([countExp])
      ..where(_db.questions.subjectId.equals(subjectId) &
          _db.questions.id.isNotInQuery(answeredSubquery));

    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }

  @override
  Future<int> purgeSolvedQuestions(String subjectId) async {
    final answeredSubquery = _db.selectOnly(_db.quizAnswers)
      ..addColumns([_db.quizAnswers.questionId]);

    final deleteQuery = _db.delete(_db.questions)
      ..where((tbl) =>
          tbl.subjectId.equals(subjectId) &
          tbl.id.isInQuery(answeredSubquery));

    return await deleteQuery.go();
  }


  @override
  Future<void> upsertQuestions(List<Question> questions) async {
    if (questions.isEmpty) return;

    await _db.batch((batch) {
      final entries = questions.map((q) {
        return QuestionsCompanion.insert(
          id: q.id,
          subjectId: q.subjectId,
          language: q.language,
          ageGroup: q.ageGroup,
          difficulty: q.difficulty,
          questionText: q.questionText,
          optionsJson: jsonEncode(q.options),
          correctOptionIndex: q.correctOptionIndex,
          explanation: q.explanation,
          category: q.category,
          source: q.source,
          packVersion: Value(q.packVersion),
          createdAt: q.createdAt,
          updatedAt: q.updatedAt,
        );
      }).toList();

      batch.insertAllOnConflictUpdate(_db.questions, entries);
    });
  }

  @override
  Future<bool> hasQuestions() async {
    final countExp = _db.questions.id.count();
    final query = _db.selectOnly(_db.questions)..addColumns([countExp]);
    final result = await query.getSingle();
    final count = result.read(countExp) ?? 0;
    return count > 0;
  }
}
