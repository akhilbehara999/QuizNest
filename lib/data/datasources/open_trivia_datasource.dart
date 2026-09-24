import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import '../../core/errors/app_exception.dart';
import '../../core/utils/html_unescape.dart';
import '../models/question_dto.dart';

class OpenTriviaDataSource {
  final http.Client _client;
  static const _uuid = Uuid();

  OpenTriviaDataSource([http.Client? client])
      : _client = client ?? http.Client();

  /// Map internal app subject ID to OpenTDB category ID.
  static const Map<String, int> subjectToOpenTdbCategory = {
    'science': 17, // Science & Nature
    'computers': 18, // Science: Computers
    'math': 19, // Science: Mathematics
    'geography': 22, // Geography
    'history': 23, // History
    'animals': 27, // Animals
    'general_knowledge': 9, // General Knowledge
    'english': 10, // Books / Language Arts
  };

  /// Check whether OpenTDB supports this subject directly.
  bool supportsSubject(String subjectId) {
    return subjectToOpenTdbCategory.containsKey(subjectId);
  }

  /// Maps app age group to OpenTDB difficulty level.
  String _mapAgeGroupToDifficulty(String ageGroup) {
    switch (ageGroup) {
      case '5-7':
        return 'easy';
      case '8-10':
        return 'easy';
      case '11-13':
        return 'medium';
      default:
        return 'easy';
    }
  }

  /// Fetches fresh questions from Open Trivia DB.
  Future<List<QuestionDto>> fetchFreshQuestions({
    required String subjectId,
    required String ageGroup,
    int amount = 10,
  }) async {
    final categoryId = subjectToOpenTdbCategory[subjectId];
    if (categoryId == null) {
      return [];
    }

    final difficulty = _mapAgeGroupToDifficulty(ageGroup);
    final url =
        'https://opentdb.com/api.php?amount=$amount&category=$categoryId&difficulty=$difficulty&type=multiple';

    final response = await _client.get(Uri.parse(url)).timeout(
      const Duration(seconds: 15),
      onTimeout: () => throw const NetworkException('OpenTDB request timed out'),
    );

    if (response.statusCode != 200) {
      throw NetworkException('OpenTDB HTTP error: ${response.statusCode}');
    }

    final dynamic decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw const ValidationException('OpenTDB response is not valid JSON map');
    }

    final responseCode = decoded['response_code'] as int? ?? -1;
    // 0 = Success, 1 = No Results
    if (responseCode != 0) {
      // If specific difficulty returned no results, retry without difficulty filter
      if (responseCode == 1) {
        final fallbackUrl =
            'https://opentdb.com/api.php?amount=$amount&category=$categoryId&type=multiple';
        final fallbackResp = await _client.get(Uri.parse(fallbackUrl)).timeout(
          const Duration(seconds: 15),
          onTimeout: () =>
              throw const NetworkException('OpenTDB fallback request timed out'),
        );
        if (fallbackResp.statusCode == 200) {
          final dynamic fallbackDecoded = jsonDecode(fallbackResp.body);
          if (fallbackDecoded is Map<String, dynamic> &&
              (fallbackDecoded['response_code'] as int? ?? -1) == 0) {
            return _parseResults(
              fallbackDecoded['results'] as List<dynamic>,
              subjectId,
              ageGroup,
              difficulty,
            );
          }
        }
      }
      return [];
    }

    final results = decoded['results'] as List<dynamic>? ?? [];
    return _parseResults(results, subjectId, ageGroup, difficulty);
  }

  List<QuestionDto> _parseResults(
    List<dynamic> results,
    String subjectId,
    String ageGroup,
    String fallbackDifficulty,
  ) {
    final now = DateTime.now();

    return results.map((raw) {
      final item = raw as Map<String, dynamic>;
      final questionText = HtmlUnescape.unescape(item['question'] as String);
      final correctAnswer =
          HtmlUnescape.unescape(item['correct_answer'] as String);
      final incorrectAnswers = (item['incorrect_answers'] as List<dynamic>)
          .map((e) => HtmlUnescape.unescape(e.toString()))
          .toList();

      final category =
          HtmlUnescape.unescape(item['category'] as String? ?? 'General');
      final diff = (item['difficulty'] as String?) ?? fallbackDifficulty;

      // Combine and shuffle options
      final options = [correctAnswer, ...incorrectAnswers]..shuffle();
      final correctIndex = options.indexOf(correctAnswer);

      return QuestionDto(
        id: 'otdb_${_uuid.v4().substring(0, 8)}',
        subjectId: subjectId,
        language: 'en',
        ageGroup: ageGroup,
        difficulty: diff,
        questionText: questionText,
        options: options,
        correctOptionIndex: correctIndex >= 0 ? correctIndex : 0,
        explanation: 'Correct answer: $correctAnswer',
        category: category,
        source: 'Open Trivia DB',
        packVersion: 1,
        createdAt: now,
        updatedAt: now,
      );
    }).toList();
  }
}
