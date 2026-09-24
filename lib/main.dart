import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'background/background_sync_worker.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/app_typography.dart';
import 'core/theme/app_theme.dart';
import 'presentation/home/home_screen.dart';
import 'presentation/onboarding/welcome_screen.dart';
import 'presentation/providers/core_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Android background WorkManager sync
  await BackgroundSyncManager.initialize();

  // Initialize SharedPreferences
  final sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPrefs),
      ],
      child: const QuizNestApp(),
    ),
  );
}

class QuizNestApp extends StatelessWidget {
  const QuizNestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const StartupGate(),
    );
  }
}

class StartupGate extends ConsumerWidget {
  const StartupGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startupAsync = ref.watch(appStartupProvider);

    return startupAsync.when(
      loading: () => const SplashScreen(),
      error: (err, stack) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, color: AppColors.error, size: 48),
                const SizedBox(height: 16),
                Text(
                  'Initialization Notice',
                  style: AppTypography.headingMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Could not open offline questions: $err',
                  textAlign: TextAlign.center,
                  style: AppTypography.bodySmall,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => ref.invalidate(appStartupProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
      data: (isOnboardingCompleted) {
        if (isOnboardingCompleted) {
          return const HomeScreen();
        } else {
          return const WelcomeScreen();
        }
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Modern 2026 App Logo Squircle with Ambient Glow
            Container(
              width: 108,
              height: 108,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2563EB).withValues(alpha: 0.18),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  'assets/images/app_logo.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.school_rounded,
                        color: AppColors.primary,
                        size: 52,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              AppConstants.appName,
              style: AppTypography.displayLarge.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 34,
                letterSpacing: -0.6,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primaryBorder, width: 1),
              ),
              child: Text(
                AppConstants.appTagline.toUpperCase(),
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                  color: AppColors.primaryDark,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const SizedBox(
              width: 26,
              height: 26,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Preparing your offline learning nest...',
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
