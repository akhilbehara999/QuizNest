import 'dart:math';

class Question {
  final String id;
  final String subjectId;
  final String language;
  final String ageGroup;
  final String difficulty;
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;
  final String category;
  final String source;
  final int packVersion;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Question({
    required this.id,
    required this.subjectId,
    required this.language,
    required this.ageGroup,
    required this.difficulty,
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
    required this.category,
    required this.source,
    required this.packVersion,
    required this.createdAt,
    required this.updatedAt,
  });

  String get correctAnswerText => options[correctOptionIndex];

  bool isCorrect(int selectedIndex) => selectedIndex == correctOptionIndex;

  /// Returns a new Question instance with options shuffled randomly
  /// and the correctOptionIndex updated to point to the correct answer's new slot.
  Question withShuffledOptions([Random? random]) {
    final rand = random ?? Random();
    final correctAnswer = options[correctOptionIndex];
    final shuffled = List<String>.from(options)..shuffle(rand);
    final newCorrectIndex = shuffled.indexOf(correctAnswer);

    return Question(
      id: id,
      subjectId: subjectId,
      language: language,
      ageGroup: ageGroup,
      difficulty: difficulty,
      questionText: questionText,
      options: shuffled,
      correctOptionIndex: newCorrectIndex >= 0 ? newCorrectIndex : 0,
      explanation: explanation,
      category: category,
      source: source,
      packVersion: packVersion,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}

