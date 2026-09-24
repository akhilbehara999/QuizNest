import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:triva/core/constants/app_constants.dart';
import 'package:triva/presentation/common/confetti_celebration.dart';
import 'package:triva/presentation/common/safety_permission_dialog.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('New 2026 Features Tests', () {
    testWidgets('SafetyPermissionDialog renders disclosure and saves acceptance',
        (WidgetTester tester) async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();

      expect(
          prefs.getBool(AppConstants.prefKeySafetyPermissionAccepted), isNull);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SafetyPermissionDialog(),
          ),
        ),
      );

      expect(find.text('Safety & Child Privacy'), findsOneWidget);
      expect(find.text('100% On-Device Privacy'), findsOneWidget);
      expect(find.text('Safe Automatic Background Updates'), findsOneWidget);

      final buttonFinder = find.text('Accept & Continue Learning');
      expect(buttonFinder, findsOneWidget);

      await tester.ensureVisible(buttonFinder);
      await tester.pumpAndSettle();
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      final updated = prefs.getBool(AppConstants.prefKeySafetyPermissionAccepted);
      expect(updated, isTrue);
    });

    testWidgets('ConfettiCelebrationOverlay renders 10/10 banner and particles',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ConfettiCelebrationOverlay(),
          ),
        ),
      );

      expect(find.text('PERFECT 10 / 10!'), findsOneWidget);
      expect(find.text('Trivia Master • 100% Flawless Score!'), findsOneWidget);
    });
  });
}
