import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/database/app_database.dart';
import '../../data/datasources/local_asset_datasource.dart';
import '../../data/datasources/open_trivia_datasource.dart';
import '../../data/datasources/static_remote_datasource.dart';
import '../../data/repositories/question_repository_impl.dart';
import '../../data/repositories/quiz_repository_impl.dart';
import '../../data/repositories/sync_repository_impl.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/question_repository.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../../domain/repositories/sync_repository.dart';
import '../../domain/repositories/user_repository.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be overridden in ProviderScope');
});

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final localAssetDataSourceProvider = Provider<LocalAssetDataSource>((ref) {
  return LocalAssetDataSource();
});

final staticRemoteDataSourceProvider = Provider<StaticRemoteDataSource>((ref) {
  return StaticRemoteDataSource();
});

final openTriviaDataSourceProvider = Provider<OpenTriviaDataSource>((ref) {
  return OpenTriviaDataSource();
});

final questionRepositoryProvider = Provider<QuestionRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return QuestionRepositoryImpl(db);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final prefs = ref.watch(sharedPreferencesProvider);
  return UserRepositoryImpl(db, prefs);
});

final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return QuizRepositoryImpl(db);
});

final syncRepositoryProvider = Provider<SyncRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final localAssets = ref.watch(localAssetDataSourceProvider);
  final remoteSource = ref.watch(staticRemoteDataSourceProvider);
  final openTriviaSource = ref.watch(openTriviaDataSourceProvider);
  final prefs = ref.watch(sharedPreferencesProvider);
  return SyncRepositoryImpl(
    db: db,
    localAssets: localAssets,
    remoteSource: remoteSource,
    openTriviaSource: openTriviaSource,
    prefs: prefs,
  );
});


/// Startup initializer: Seeds bundled offline questions into SQLite if not already seeded.
final appStartupProvider = FutureProvider<bool>((ref) async {
  final syncRepo = ref.watch(syncRepositoryProvider);
  await syncRepo.seedInitialQuestionsIfEmpty();
  final userRepo = ref.watch(userRepositoryProvider);
  return await userRepo.isOnboardingCompleted();
});
