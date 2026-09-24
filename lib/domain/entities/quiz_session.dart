class QuizSession {
  final String id;
  final String subjectId;
  final String ageGroup;
  final int totalQuestions;
  final int score;
  final bool isCompleted;
  final DateTime startedAt;
  final DateTime? completedAt;

  const QuizSession({
    required this.id,
    required this.subjectId,
    required this.ageGroup,
    required this.totalQuestions,
    required this.score,
    required this.isCompleted,
    required this.startedAt,
    this.completedAt,
  });

  double get accuracyPercent =>
      totalQuestions > 0 ? (score / totalQuestions) * 100 : 0.0;
}
