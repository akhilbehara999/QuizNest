import 'dart:convert';
import 'dart:math';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triva/core/utils/html_unescape.dart';
import 'package:triva/data/database/app_database.dart';
import 'package:triva/data/datasources/local_asset_datasource.dart';
import 'package:triva/data/datasources/open_trivia_datasource.dart';
import 'package:triva/data/datasources/static_remote_datasource.dart';
import 'package:triva/data/repositories/question_repository_impl.dart';
import 'package:triva/data/repositories/sync_repository_impl.dart';
import 'package:triva/domain/entities/question.dart';

void main() {
  group('HtmlUnescape Tests', () {
    test('Unescapes named HTML entities', () {
      final input = '&quot;To be or not to be&quot; &amp; &apos;Cats &lt; Dogs&gt;';
      final output = HtmlUnescape.unescape(input);
      expect(output, equals('"To be or not to be" & \'Cats < Dogs>'));
    });

    test('Unescapes decimal entities', () {
      final input = 'It&#039;s a test &#38; 90&#176;';
      final output = HtmlUnescape.unescape(input);
      expect(output, equals("It's a test & 90°"));
    });

    test('Unescapes hex entities', () {
      final input = 'Hello &#x22;World&#x22; &#x27;Test&#x27;';
      final output = HtmlUnescape.unescape(input);
      expect(output, equals('Hello "World" \'Test\''));
    });
  });

  group('Option Shuffling & Randomization Tests', () {
    test('withShuffledOptions properly tracks correct answer even when options move', () {
      final original = Question(
        id: 'q1',
        subjectId: 'science',
        language: 'en',
        ageGroup: '5-7',
        difficulty: 'easy',
        questionText: 'What is our planet?',
        options: ['Earth', 'Mars', 'Jupiter', 'Venus'],
        correctOptionIndex: 0, // 'Earth'
        explanation: 'We live on Earth.',
        category: 'Astronomy',
        source: 'Core',
        packVersion: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Verify original correct answer text
      expect(original.correctAnswerText, equals('Earth'));

      // Use a fixed seed to test deterministic shuffling
      final shuffled = original.withShuffledOptions(Random(42));

      // Shuffled options must contain all 4 elements
      expect(shuffled.options.length, equals(4));
      expect(shuffled.options.contains('Earth'), isTrue);

      // The new correctOptionIndex MUST point to 'Earth'!
      expect(shuffled.options[shuffled.correctOptionIndex], equals('Earth'));
      expect(shuffled.correctAnswerText, equals('Earth'));
      expect(shuffled.isCorrect(shuffled.correctOptionIndex), isTrue);
    });
  });

  group('OpenTriviaDataSource Tests', () {
    test('Parses OpenTDB mock response and unescapes entities', () async {
      final mockResponse = {
        'response_code': 0,
        'results': [
          {
            'type': 'multiple',
            'difficulty': 'easy',
            'category': 'Science: Computers',
            'question': 'What does &quot;CPU&quot; stand for?',
            'correct_answer': 'Central Processing Unit',
            'incorrect_answers': [
              'Central Process Unit',
              'Computer Personal Unit',
              'Central Processor Unit',
            ],
          }
        ]
      };

      final client = MockClient((request) async {
        return http.Response(jsonEncode(mockResponse), 200);
      });

      final dataSource = OpenTriviaDataSource(client);
      final questions = await dataSource.fetchFreshQuestions(
        subjectId: 'computers',
        ageGroup: '8-10',
        amount: 1,
      );

      expect(questions.length, equals(1));
      final q = questions.first;
      expect(q.questionText, equals('What does "CPU" stand for?'));
      expect(q.options.contains('Central Processing Unit'), isTrue);
      expect(q.options[q.correctOptionIndex], equals('Central Processing Unit'));
      expect(q.category, equals('Science: Computers'));
      expect(q.subjectId, equals('computers'));
    });
  });

  group('Unsolved Question Filtering and Auto-Replenish Tests', () {
    late AppDatabase db;
    late QuestionRepositoryImpl questionRepo;

    setUp(() {
      db = AppDatabase(NativeDatabase.memory());
      questionRepo = QuestionRepositoryImpl(db);
    });

    tearDown(() async {
      await db.close();
    });

    test('getQuestionsForQuiz excludes previously answered questions', () async {
      // 1. Insert 3 questions for computers
      final q1 = Question(
        id: 'comp_1',
        subjectId: 'computers',
        language: 'en',
        ageGroup: '8-10',
        difficulty: 'easy',
        questionText: 'Question 1',
        options: ['A1', 'B1', 'C1', 'D1'],
        correctOptionIndex: 0,
        explanation: 'Exp 1',
        category: 'Hardware',
        source: 'Test',
        packVersion: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final q2 = Question(
        id: 'comp_2',
        subjectId: 'computers',
        language: 'en',
        ageGroup: '8-10',
        difficulty: 'easy',
        questionText: 'Question 2',
        options: ['A2', 'B2', 'C2', 'D2'],
        correctOptionIndex: 0,
        explanation: 'Exp 2',
        category: 'Hardware',
        source: 'Test',
        packVersion: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await questionRepo.upsertQuestions([q1, q2]);

      // 2. Mark comp_1 as solved in QuizAnswers table
      await db.into(db.quizAnswers).insert(
            QuizAnswersCompanion.insert(
              id: 'ans_1',
              sessionId: 'sess_1',
              questionId: 'comp_1',
              selectedOptionIndex: 0,
              isCorrect: true,
              answeredAt: DateTime.now(),
            ),
          );

      // 3. Unsolved count for computers should now be 1
      final unsolvedCount =
          await questionRepo.getUnsolvedQuestionCountForSubject('computers');
      expect(unsolvedCount, equals(1));

      // 4. Requesting questions should pick comp_2 (unsolved) first
      final selected = await questionRepo.getQuestionsForQuiz(
        subjectId: 'computers',
        ageGroup: '8-10',
        count: 1,
      );

      expect(selected.length, equals(1));
      expect(selected.first.id, equals('comp_2'));
    });

    test('replenishSolvedQuestions fetches fresh questions from OpenTDB and purges solved ones', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();

      // Seed 1 question that is solved
      await questionRepo.upsertQuestions([
        Question(
          id: 'old_solved_1',
          subjectId: 'science',
          language: 'en',
          ageGroup: '8-10',
          difficulty: 'easy',
          questionText: 'Old Solved Question',
          options: ['A', 'B', 'C', 'D'],
          correctOptionIndex: 0,
          explanation: 'Exp',
          category: 'Nature',
          source: 'Seed',
          packVersion: 1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ]);

      // Record it as solved
      await db.into(db.quizAnswers).insert(
            QuizAnswersCompanion.insert(
              id: 'ans_old',
              sessionId: 'sess_old',
              questionId: 'old_solved_1',
              selectedOptionIndex: 0,
              isCorrect: true,
              answeredAt: DateTime.now(),
            ),
          );

      // Mock OpenTDB client returning 2 fresh questions
      final mockResponse = {
        'response_code': 0,
        'results': [
          {
            'type': 'multiple',
            'difficulty': 'easy',
            'category': 'Science & Nature',
            'question': 'What is the chemical formula for table salt?',
            'correct_answer': 'NaCl',
            'incorrect_answers': ['H2O', 'CO2', 'O2'],
          },
          {
            'type': 'multiple',
            'difficulty': 'easy',
            'category': 'Science & Nature',
            'question': 'How many legs does a spider have?',
            'correct_answer': '8',
            'incorrect_answers': ['6', '10', '4'],
          },
        ]
      };

      final client = MockClient((request) async {
        return http.Response(jsonEncode(mockResponse), 200);
      });

      final openTriviaSource = OpenTriviaDataSource(client);
      final syncRepo = SyncRepositoryImpl(
        db: db,
        localAssets: LocalAssetDataSource(),
        remoteSource: StaticRemoteDataSource(),
        openTriviaSource: openTriviaSource,
        prefs: prefs,
      );

      // Run replenishment for science
      final result = await syncRepo.replenishSolvedQuestions(
        subjectId: 'science',
        ageGroup: '8-10',
      );

      expect(result.success, isTrue);
      expect(result.questionsAddedOrUpdated, equals(2));

      // The old solved question should have been purged
      final remainingCount =
          await questionRepo.getQuestionCountForSubject('science');
      expect(remainingCount, equals(2));

      final unsolvedCount =
          await questionRepo.getUnsolvedQuestionCountForSubject('science');
      expect(unsolvedCount, equals(2));
    });
  });
}
