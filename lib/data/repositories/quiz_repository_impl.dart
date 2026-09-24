import 'package:drift/drift.dart';
import '../../domain/entities/quiz_session.dart';
import '../../domain/entities/quiz_answer.dart';
import '../../domain/entities/learning_progress.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../database/app_database.dart';

class QuizRepositoryImpl implements QuizRepository {
  final AppDatabase _db;

  QuizRepositoryImpl(this._db);

  @override
  Future<void> saveQuizSession(QuizSession session) async {
    final companion = QuizSessionsCompanion.insert(
      id: session.id,
      subjectId: session.subjectId,
      ageGroup: session.ageGroup,
      totalQuestions: session.totalQuestions,
      score: Value(session.score),
      isCompleted: Value(session.isCompleted),
      startedAt: session.startedAt,
      completedAt: Value(session.completedAt),
    );

    await _db.into(_db.quizSessions).insertOnConflictUpdate(companion);
  }

  @override
  Future<void> saveQuizAnswer(QuizAnswer answer) async {
    final companion = QuizAnswersCompanion.insert(
      id: answer.id,
      sessionId: answer.sessionId,
      questionId: answer.questionId,
      selectedOptionIndex: answer.selectedOptionIndex,
      isCorrect: answer.isCorrect,
      answeredAt: answer.answeredAt,
    );

    await _db.into(_db.quizAnswers).insertOnConflictUpdate(companion);
  }

  @override
  Future<QuizSession?> getActiveSession() async {
    final query = _db.select(_db.quizSessions)
      ..where((tbl) => tbl.isCompleted.equals(false))
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.startedAt)])
      ..limit(1);

    final row = await query.getSingleOrNull();
    if (row == null) return null;

    return QuizSession(
      id: row.id,
      subjectId: row.subjectId,
      ageGroup: row.ageGroup,
      totalQuestions: row.totalQuestions,
      score: row.score,
      isCompleted: row.isCompleted,
      startedAt: row.startedAt,
      completedAt: row.completedAt,
    );
  }

  @override
  Future<List<QuizSession>> getRecentSessions({int limit = 10}) async {
    final query = _db.select(_db.quizSessions)
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.startedAt)])
      ..limit(limit);

    final rows = await query.get();
    return rows
        .map((r) => QuizSession(
              id: r.id,
              subjectId: r.subjectId,
              ageGroup: r.ageGroup,
              totalQuestions: r.totalQuestions,
              score: r.score,
              isCompleted: r.isCompleted,
              startedAt: r.startedAt,
              completedAt: r.completedAt,
            ))
        .toList();
  }

  @override
  Future<OverallProgressSummary> getOverallProgress() async {
    final rows = await _db.select(_db.learningProgress).get();

    int totalAnswered = 0;
    int totalCorrect = 0;
    final Map<String, LearningProgressData> progressMap = {};

    for (final row in rows) {
      totalAnswered += row.totalAnswered;
      totalCorrect += row.totalCorrect;
      progressMap[row.subjectId] = LearningProgressData(
        subjectId: row.subjectId,
        totalAnswered: row.totalAnswered,
        totalCorrect: row.totalCorrect,
        accuracy: row.accuracy,
        lastPlayedAt: row.lastPlayedAt,
      );
    }

    final double overallAccuracy =
        totalAnswered > 0 ? (totalCorrect / totalAnswered) * 100 : 0.0;
    final int totalStars = totalCorrect * 10;

    return OverallProgressSummary(
      totalAnswered: totalAnswered,
      totalCorrect: totalCorrect,
      totalStars: totalStars,
      overallAccuracy: overallAccuracy,
      subjectProgress: progressMap,
    );
  }

  @override
  Future<LearningProgressData?> getSubjectProgress(String subjectId) async {
    final query = _db.select(_db.learningProgress)
      ..where((tbl) => tbl.subjectId.equals(subjectId));
    final row = await query.getSingleOrNull();
    if (row == null) return null;

    return LearningProgressData(
      subjectId: row.subjectId,
      totalAnswered: row.totalAnswered,
      totalCorrect: row.totalCorrect,
      accuracy: row.accuracy,
      lastPlayedAt: row.lastPlayedAt,
    );
  }

  @override
  Future<void> updateSubjectProgress({
    required String subjectId,
    required int answeredIncrement,
    required int correctIncrement,
  }) async {
    final existing = await getSubjectProgress(subjectId);
    final now = DateTime.now();

    final int newAnswered = (existing?.totalAnswered ?? 0) + answeredIncrement;
    final int newCorrect = (existing?.totalCorrect ?? 0) + correctIncrement;
    final double newAccuracy =
        newAnswered > 0 ? (newCorrect / newAnswered) * 100 : 0.0;

    final companion = LearningProgressCompanion.insert(
      subjectId: subjectId,
      totalAnswered: Value(newAnswered),
      totalCorrect: Value(newCorrect),
      accuracy: Value(newAccuracy),
      lastPlayedAt: Value(now),
    );

    await _db.into(_db.learningProgress).insertOnConflictUpdate(companion);
  }
}
