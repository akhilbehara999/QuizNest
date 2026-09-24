class QuizAnswer {
  final String id;
  final String sessionId;
  final String questionId;
  final int selectedOptionIndex;
  final bool isCorrect;
  final DateTime answeredAt;

  const QuizAnswer({
    required this.id,
    required this.sessionId,
    required this.questionId,
    required this.selectedOptionIndex,
    required this.isCorrect,
    required this.answeredAt,
  });
}
