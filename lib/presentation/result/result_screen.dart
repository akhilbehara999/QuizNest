import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_typography.dart';
import '../common/app_button.dart';
import '../common/app_card.dart';
import '../common/confetti_celebration.dart';
import '../common/responsive_container.dart';
import '../home/home_screen.dart';
import '../providers/quiz_provider.dart';
import '../providers/user_profile_provider.dart';

class ResultScreen extends ConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizProvider);
    final subjectConfig = SubjectConfig.findById(quizState.subjectId);
    final subjectName = subjectConfig?.name ?? quizState.subjectId;
    final total = quizState.totalQuestions;
    final score = quizState.score;
    final accuracy = total > 0 ? (score / total) * 100 : 0.0;
    final starsEarned = score * AppConstants.pointsPerCorrectAnswer;
    final isPerfectScore = score >= 10 && score == total;

    String heading = 'Great job! 🎉';
    String message = 'You showed fantastic curiosity and knowledge.';

    if (isPerfectScore) {
      heading = 'Perfect 10 / 10! 🏆';
      message = 'Flawless victory! You answered every single question correctly!';
    } else if (accuracy >= 80) {
      heading = 'Outstanding! 🌟';
      message = 'You have a wonderful mastery of this subject!';
    } else if (accuracy < 50) {
      heading = 'Good Practice! 📚';
      message = 'Every quiz helps your brain grow stronger!';
    }

    final int starCount = accuracy >= 80 ? 3 : (accuracy >= 50 ? 2 : 1);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SafeArea(
            child: ResponsiveContainer(
              maxWidth: 520,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              // 3 Stars celebration row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  final isEarned = index < starCount;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      isEarned ? Icons.star_rounded : Icons.star_outline_rounded,
                      color: isEarned ? AppColors.star : AppColors.border,
                      size: index == 1 ? 52 : 40,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 14),
              Text(
                heading,
                style: AppTypography.displayMedium.copyWith(
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                message,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              AppCard(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  children: [
                    Text(
                      '$score / $total',
                      style: const TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${accuracy.toStringAsFixed(0)}% Accuracy',
                      style: AppTypography.labelLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Divider(),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Subject',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textMuted,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              subjectName,
                              style: AppTypography.labelLarge.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 1,
                          height: 38,
                          color: AppColors.border,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Stars Earned',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textMuted,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star_rounded,
                                    color: AppColors.star, size: 22),
                                const SizedBox(width: 4),
                                Text(
                                  '+$starsEarned',
                                  style: AppTypography.labelLarge.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              AppButton(
                label: 'Play Again',
                icon: Icons.replay_rounded,
                onPressed: () {
                  final ageGroup = ref.read(userProfileProvider)?.ageGroup ??
                      AppConstants.ageGroup8to10;
                  ref.read(quizProvider.notifier).startQuiz(
                        subjectId: quizState.subjectId,
                        ageGroup: ageGroup,
                      );
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(height: 12),
              AppButton(
                label: 'Back to Home',
                isPrimary: false,
                icon: Icons.home_rounded,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      if (isPerfectScore) const ConfettiCelebrationOverlay(),
    ],
  ),
);
  }
}
