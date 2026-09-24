class LearningProgressData {
  final String subjectId;
  final int totalAnswered;
  final int totalCorrect;
  final double accuracy;
  final DateTime? lastPlayedAt;

  const LearningProgressData({
    required this.subjectId,
    required this.totalAnswered,
    required this.totalCorrect,
    required this.accuracy,
    this.lastPlayedAt,
  });

  int get starPoints => totalCorrect * 10;
}

class OverallProgressSummary {
  final int totalAnswered;
  final int totalCorrect;
  final int totalStars;
  final double overallAccuracy;
  final Map<String, LearningProgressData> subjectProgress;

  const OverallProgressSummary({
    required this.totalAnswered,
    required this.totalCorrect,
    required this.totalStars,
    required this.overallAccuracy,
    required this.subjectProgress,
  });

  factory OverallProgressSummary.empty() => const OverallProgressSummary(
        totalAnswered: 0,
        totalCorrect: 0,
        totalStars: 0,
        overallAccuracy: 0.0,
        subjectProgress: {},
      );
}
