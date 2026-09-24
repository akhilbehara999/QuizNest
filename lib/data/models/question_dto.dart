import 'dart:convert';
import '../../domain/entities/question.dart';
import '../database/app_database.dart';

class QuestionDto {
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

  const QuestionDto({
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

  factory QuestionDto.fromJson(Map<String, dynamic> json) {
    final rawOptions = json['options'] as List;
    final options = rawOptions.map((e) => e.toString()).toList();

    return QuestionDto(
      id: json['id'] as String,
      subjectId: json['subjectId'] as String,
      language: (json['language'] as String?) ?? 'en',
      ageGroup: (json['ageGroup'] as String?) ?? 'all',
      difficulty: (json['difficulty'] as String?) ?? 'medium',
      questionText: json['questionText'] as String,
      options: options,
      correctOptionIndex: json['correctOption'] as int,
      explanation: json['explanation'] as String,
      category: (json['category'] as String?) ?? 'General',
      source: (json['source'] as String?) ?? 'QuizNest Core',
      packVersion: (json['packVersion'] as int?) ?? 1,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String) ?? DateTime.now()
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'] as String) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'subjectId': subjectId,
        'language': language,
        'ageGroup': ageGroup,
        'difficulty': difficulty,
        'questionText': questionText,
        'options': options,
        'correctOption': correctOptionIndex,
        'explanation': explanation,
        'category': category,
        'source': source,
        'packVersion': packVersion,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory QuestionDto.fromEntry(QuestionEntry entry) {
    final List<dynamic> decoded = jsonDecode(entry.optionsJson) as List<dynamic>;
    return QuestionDto(
      id: entry.id,
      subjectId: entry.subjectId,
      language: entry.language,
      ageGroup: entry.ageGroup,
      difficulty: entry.difficulty,
      questionText: entry.questionText,
      options: decoded.map((e) => e.toString()).toList(),
      correctOptionIndex: entry.correctOptionIndex,
      explanation: entry.explanation,
      category: entry.category,
      source: entry.source,
      packVersion: entry.packVersion,
      createdAt: entry.createdAt,
      updatedAt: entry.updatedAt,
    );
  }

  Question toDomain() {
    return Question(
      id: id,
      subjectId: subjectId,
      language: language,
      ageGroup: ageGroup,
      difficulty: difficulty,
      questionText: questionText,
      options: options,
      correctOptionIndex: correctOptionIndex,
      explanation: explanation,
      category: category,
      source: source,
      packVersion: packVersion,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
