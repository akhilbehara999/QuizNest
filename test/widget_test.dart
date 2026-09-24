import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:triva/presentation/common/app_button.dart';
import 'package:triva/presentation/onboarding/welcome_screen.dart';
import 'package:triva/presentation/quiz/widgets/answer_option_button.dart';
import 'package:triva/presentation/quiz/widgets/question_card.dart';

void main() {
  group('Widget Tests', () {
    testWidgets('WelcomeScreen renders QuizNest title and Get Started button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: WelcomeScreen(),
        ),
      );

      expect(find.text('QuizNest'), findsOneWidget);
      expect(find.text('Learn • Think • Play'), findsOneWidget);
      expect(find.text('Get Started'), findsOneWidget);
      expect(find.text('Offline Ready'), findsOneWidget);
    });

    testWidgets('AppButton triggers callback when tapped',
        (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppButton(
              label: 'Click Me',
              onPressed: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Click Me'), findsOneWidget);
      await tester.tap(find.text('Click Me'));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('AnswerOptionButton displays text, letter, and triggers callback',
        (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnswerOptionButton(
              optionIndex: 0,
              optionText: 'Earth',
              isSelected: false,
              isSubmitted: false,
              isCorrectOption: false,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('A'), findsOneWidget);
      expect(find.text('Earth'), findsOneWidget);

      await tester.tap(find.text('Earth'));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('QuestionCard renders category badge and question text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: QuestionCard(
              questionText: 'What planet is known as the Red Planet?',
              category: 'Astronomy',
              difficulty: 'medium',
            ),
          ),
        ),
      );

      expect(find.text('What planet is known as the Red Planet?'), findsOneWidget);
      expect(find.text('Astronomy'), findsOneWidget);
      expect(find.text('MEDIUM'), findsOneWidget);
    });
  });
}
