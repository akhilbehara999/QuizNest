import 'package:flutter_test/flutter_test.dart';
import 'package:triva/core/errors/app_exception.dart';
import 'package:triva/core/utils/checksum_util.dart';
import 'package:triva/core/utils/json_validator.dart';
import 'package:triva/domain/entities/question.dart';

void main() {
  group('JsonValidator Tests', () {
    test('Valid question map passes validation', () {
      final validQuestion = {
        'id': 'test_001',
        'subjectId': 'science',
        'language': 'en',
        'ageGroup': '5-7',
        'difficulty': 'easy',
        'questionText': 'What planet do we live on?',
        'options': ['Earth', 'Mars', 'Venus', 'Jupiter'],
        'correctOption': 0,
        'explanation': 'Earth is our home planet.',
        'category': 'Astronomy',
      };

      expect(() => JsonValidator.validateQuestion(validQuestion), returnsNormally);
    });

    test('Missing questionText throws ValidationException', () {
      final invalidQuestion = {
        'id': 'test_002',
        'subjectId': 'science',
        'language': 'en',
        'ageGroup': '5-7',
        'difficulty': 'easy',
        'questionText': '',
        'options': ['A', 'B', 'C', 'D'],
        'correctOption': 0,
        'explanation': 'Explanation',
      };

      expect(
        () => JsonValidator.validateQuestion(invalidQuestion),
        throwsA(isA<ValidationException>()),
      );
    });

    test('Question with fewer than 4 options throws ValidationException', () {
      final invalidQuestion = {
        'id': 'test_003',
        'subjectId': 'science',
        'questionText': 'Valid text?',
        'options': ['A', 'B', 'C'], // Only 3 options
        'correctOption': 0,
        'explanation': 'Explanation',
      };

      expect(
        () => JsonValidator.validateQuestion(invalidQuestion),
        throwsA(isA<ValidationException>()),
      );
    });

    test('Question with invalid correctOption index throws ValidationException', () {
      final invalidQuestion = {
        'id': 'test_004',
        'subjectId': 'science',
        'questionText': 'Valid text?',
        'options': ['A', 'B', 'C', 'D'],
        'correctOption': 5, // Out of bounds
        'explanation': 'Explanation',
      };

      expect(
        () => JsonValidator.validateQuestion(invalidQuestion),
        throwsA(isA<ValidationException>()),
      );
    });

    test('Question pack with duplicate IDs throws ValidationException', () {
      final packWithDuplicates = {
        'packId': 'pack_001',
        'subjectId': 'math',
        'version': 1,
        'questions': [
          {
            'id': 'dup_1',
            'subjectId': 'math',
            'questionText': '2 + 2?',
            'options': ['4', '5', '6', '7'],
            'correctOption': 0,
            'explanation': '2+2=4',
          },
          {
            'id': 'dup_1', // Duplicate ID
            'subjectId': 'math',
            'questionText': '3 + 3?',
            'options': ['6', '5', '4', '7'],
            'correctOption': 0,
            'explanation': '3+3=6',
          },
        ],
      };

      expect(
        () => JsonValidator.validateQuestionPack(packWithDuplicates),
        throwsA(isA<ValidationException>()),
      );
    });
  });

  group('ChecksumUtil Tests', () {
    test('Computes consistent SHA-256 for string', () {
      const content = 'QuizNest offline trivia content test payload';
      final hash1 = ChecksumUtil.computeSha256(content);
      final hash2 = ChecksumUtil.computeSha256(content);

      expect(hash1, equals(hash2));
      expect(hash1.length, equals(64));
    });

    test('Verifies valid SHA-256 checksum correctly', () {
      const content = 'Test payload for integrity verification';
      final expectedSha = ChecksumUtil.computeSha256(content);

      expect(ChecksumUtil.verifySha256(content, expectedSha), isTrue);
      expect(ChecksumUtil.verifySha256(content, 'wrong_sha256_hash'), isFalse);
    });

    test('Null or empty checksum passes optionally', () {
      expect(ChecksumUtil.verifySha256('any content', null), isTrue);
      expect(ChecksumUtil.verifySha256('any content', ''), isTrue);
    });
  });

  group('Question Entity Logic Tests', () {
    test('Question entity evaluates correctness accurately', () {
      final question = Question(
        id: 'q_01',
        subjectId: 'telugu',
        language: 'te',
        ageGroup: '5-7',
        difficulty: 'easy',
        questionText: 'భారతదేశ జాతీయ పక్షి ఏది?',
        options: ['నెమలి', 'చిలుక', 'పావురం', 'కాకి'],
        correctOptionIndex: 0,
        explanation: 'నెమలి మన దేశ అధికారిక జాతీయ పక్షి.',
        category: 'జాతీయ చిహ్నాలు',
        source: 'Core',
        packVersion: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(question.isCorrect(0), isTrue);
      expect(question.isCorrect(1), isFalse);
      expect(question.correctAnswerText, equals('నెమలి'));
    });
  });
}
