import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../common/app_button.dart';

class FeedbackBanner extends StatelessWidget {
  final bool isCorrect;
  final String explanation;
  final String correctAnswerText;
  final bool isLastQuestion;
  final VoidCallback onNext;

  const FeedbackBanner({
    super.key,
    required this.isCorrect,
    required this.explanation,
    required this.correctAnswerText,
    required this.isLastQuestion,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isCorrect ? AppColors.successLight : AppColors.errorLight;
    final borderColor = isCorrect ? AppColors.successBorder : AppColors.errorBorder;
    final headerColor = isCorrect ? AppColors.success : AppColors.error;
    final headerTitle = isCorrect ? 'Correct! 🌟' : 'Nice try! Keep going!';

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1.0),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                isCorrect ? Icons.check_circle_rounded : Icons.lightbulb_outline_rounded,
                color: headerColor,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                headerTitle,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: headerColor,
                ),
              ),
            ],
          ),
          if (!isCorrect) ...[
            const SizedBox(height: 6),
            RichText(
              text: TextSpan(
                style: AppTypography.bodySmall.copyWith(color: AppColors.textPrimary),
                children: [
                  const TextSpan(
                    text: 'Correct answer: ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: correctAnswerText,
                    style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.success),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 8),
          Text(
            explanation,
            style: AppTypography.explanationText,
          ),
          const SizedBox(height: 14),
          AppButton(
            label: isLastQuestion ? 'View Results' : 'Next Question',
            icon: Icons.arrow_forward_rounded,
            onPressed: onNext,
            height: 48,
          ),
        ],
      ),
    );
  }
}
