import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';

class AnswerOptionButton extends StatelessWidget {
  final int optionIndex;
  final String optionText;
  final bool isSelected;
  final bool isSubmitted;
  final bool isCorrectOption;
  final VoidCallback onTap;

  const AnswerOptionButton({
    super.key,
    required this.optionIndex,
    required this.optionText,
    required this.isSelected,
    required this.isSubmitted,
    required this.isCorrectOption,
    required this.onTap,
  });

  static const List<String> optionLabels = ['A', 'B', 'C', 'D'];

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = AppColors.surface;
    Color borderColor = AppColors.border;
    Color labelBgColor = AppColors.surfaceVariant;
    Color labelTextColor = AppColors.textPrimary;
    Widget? trailingIcon;

    if (!isSubmitted) {
      if (isSelected) {
        backgroundColor = AppColors.primaryLight;
        borderColor = AppColors.primary;
        labelBgColor = AppColors.primary;
        labelTextColor = Colors.white;
      }
    } else {
      if (isCorrectOption) {
        backgroundColor = AppColors.successLight;
        borderColor = AppColors.success;
        labelBgColor = AppColors.success;
        labelTextColor = Colors.white;
        trailingIcon = const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 22);
      } else if (isSelected && !isCorrectOption) {
        backgroundColor = AppColors.errorLight;
        borderColor = AppColors.error;
        labelBgColor = AppColors.error;
        labelTextColor = Colors.white;
        trailingIcon = const Icon(Icons.cancel_rounded, color: AppColors.error, size: 22);
      }
    }

    final letter = optionIndex < optionLabels.length
        ? optionLabels[optionIndex]
        : '${optionIndex + 1}';

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: isSubmitted ? null : onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            constraints: const BoxConstraints(minHeight: 58),
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor,
                width: isSelected || (isSubmitted && isCorrectOption) ? 1.8 : 1.0,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: labelBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    letter,
                    style: TextStyle(
                      color: labelTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    optionText,
                    style: AppTypography.optionText,
                  ),
                ),
                if (trailingIcon != null) ...[
                  const SizedBox(width: 10),
                  trailingIcon,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
