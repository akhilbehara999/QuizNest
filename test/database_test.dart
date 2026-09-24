import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:triva/data/database/app_database.dart';
import 'package:triva/data/repositories/question_repository_impl.dart';
import 'package:triva/data/repositories/quiz_repository_impl.dart';
import 'package:triva/domain/entities/question.dart';
import 'package:triva/domain/entities/quiz_session.dart';

void main() {
  late AppDatabase db;
  late QuestionRepositoryImpl questionRepo;
  late QuizRepositoryImpl quizRepo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    questionRepo = QuestionRepositoryImpl(db);
    quizRepo = QuizRepositoryImpl(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('Drift SQLite Database Tests', () {
    test('Can insert and retrieve questions filtered by subject and age group', () async {
      final sampleQuestions = [
        Question(
          id: 'sci_01',
          subjectId: 'science',
          language: 'en',
          ageGroup: '5-7',
          difficulty: 'easy',
          questionText: 'What planet is our home?',
          options: ['Earth', 'Mars', 'Venus', 'Saturn'],
          correctOptionIndex: 0,
          explanation: 'Earth is our home planet.',
          category: 'Astronomy',
          source: 'Core',
          packVersion: 1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        Question(
          id: 'sci_02',
          subjectId: 'science',
          language: 'en',
          ageGroup: '8-10',
          difficulty: 'medium',
          questionText: 'What is the chemical formula for water?',
          options: ['H2O', 'CO2', 'NaCl', 'O2'],
          correctOptionIndex: 0,
          explanation: 'H2O stands for water.',
          category: 'Chemistry',
          source: 'Core',
          packVersion: 1,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      await questionRepo.upsertQuestions(sampleQuestions);

      final count = await questionRepo.getQuestionCountForSubject('science');
      expect(count, equals(2));

      final retrieved5to7 = await questionRepo.getQuestionsForQuiz(
        subjectId: 'science',
        ageGroup: '5-7',
        count: 10,
      );

      expect(retrieved5to7.isNotEmpty, isTrue);
      expect(retrieved5to7.any((q) => q.id == 'sci_01'), isTrue);
    });

    test('Duplicate questions update without creating duplicate rows', () async {
      final q1 = Question(
        id: 'dup_test_1',
        subjectId: 'math',
        language: 'en',
        ageGroup: '5-7',
        difficulty: 'easy',
        questionText: '2 + 2 = ?',
        options: ['4', '5', '6', '7'],
        correctOptionIndex: 0,
        explanation: 'Initial explanation',
        category: 'Arithmetic',
        source: 'Core',
        packVersion: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await questionRepo.upsertQuestions([q1]);

      final q1Updated = Question(
        id: 'dup_test_1',
        subjectId: 'math',
        language: 'en',
        ageGroup: '5-7',
        difficulty: 'easy',
        questionText: '2 + 2 = ?',
        options: ['4', '5', '6', '7'],
        correctOptionIndex: 0,
        explanation: 'Updated educational explanation',
        category: 'Arithmetic',
        source: 'Core',
        packVersion: 2,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await questionRepo.upsertQuestions([q1Updated]);

      final count = await questionRepo.getQuestionCountForSubject('math');
      expect(count, equals(1)); // Still only 1 row!

      final rows = await questionRepo.getQuestionsForQuiz(
        subjectId: 'math',
        ageGroup: '5-7',
        count: 1,
      );
      expect(rows.first.explanation, equals('Updated educational explanation'));
    });

    test('Learning progress updates correctly after quiz sessions', () async {
      await quizRepo.updateSubjectProgress(
        subjectId: 'science',
        answeredIncrement: 10,
        correctIncrement: 8,
      );

      var progress = await quizRepo.getSubjectProgress('science');
      expect(progress?.totalAnswered, equals(10));
      expect(progress?.totalCorrect, equals(8));
      expect(progress?.accuracy, equals(80.0));
      expect(progress?.starPoints, equals(80));

      // Second session: answered 5, correct 4
      await quizRepo.updateSubjectProgress(
        subjectId: 'science',
        answeredIncrement: 5,
        correctIncrement: 4,
      );

      progress = await quizRepo.getSubjectProgress('science');
      expect(progress?.totalAnswered, equals(15));
      expect(progress?.totalCorrect, equals(12));
      expect(progress?.accuracy, closeTo(80.0, 0.1));
    });

    test('Saves and retrieves active and recent quiz sessions', () async {
      final session = QuizSession(
        id: 'session_001',
        subjectId: 'computers',
        ageGroup: '8-10',
        totalQuestions: 10,
        score: 7,
        isCompleted: true,
        startedAt: DateTime.now().subtract(const Duration(minutes: 5)),
        completedAt: DateTime.now(),
      );

      await quizRepo.saveQuizSession(session);

      final recents = await quizRepo.getRecentSessions();
      expect(recents.length, equals(1));
      expect(recents.first.id, equals('session_001'));
      expect(recents.first.accuracyPercent, equals(70.0));
    });
  });
}
