import '../entities/quiz_session.dart';
import '../entities/quiz_answer.dart';
import '../entities/learning_progress.dart';

abstract class QuizRepository {
  Future<void> saveQuizSession(QuizSession session);

  Future<void> saveQuizAnswer(QuizAnswer answer);

  Future<QuizSession?> getActiveSession();

  Future<List<QuizSession>> getRecentSessions({int limit = 10});

  Future<OverallProgressSummary> getOverallProgress();

  Future<LearningProgressData?> getSubjectProgress(String subjectId);

  Future<void> updateSubjectProgress({
    required String subjectId,
    required int answeredIncrement,
    required int correctIncrement,
  });
}
