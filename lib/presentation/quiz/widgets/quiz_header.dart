import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_typography.dart';

class QuizHeader extends StatelessWidget {
  final String subjectId;
  final int currentIndex;
  final int totalQuestions;
  final VoidCallback onExit;

  const QuizHeader({
    super.key,
    required this.subjectId,
    required this.currentIndex,
    required this.totalQuestions,
    required this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    final subjectConfig = SubjectConfig.findById(subjectId);
    final subjectName = subjectConfig?.name ?? subjectId;
    final progress = totalQuestions > 0 ? (currentIndex + 1) / totalQuestions : 0.0;
    final accentColor = subjectConfig?.accentColor ?? AppColors.primary;
    final lightColor = subjectConfig?.lightColor ?? AppColors.primaryLight;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: onExit,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close_rounded, size: 20, color: AppColors.textSecondary),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    subjectConfig?.icon ?? Icons.quiz_outlined,
                    color: accentColor,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  subjectName,
                  style: AppTypography.headingMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${currentIndex + 1} / $totalQuestions',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: AppColors.border,
            valueColor: AlwaysStoppedAnimation<Color>(accentColor),
          ),
        ),
      ],
    );
  }
}
