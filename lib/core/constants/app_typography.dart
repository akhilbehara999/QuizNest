import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Typography system configured for high legibility for young readers.
/// Supports standard Latin text, Telugu, and Hindi glyphs with proper line spacing.
class AppTypography {
  AppTypography._();

  static const List<String> fontFamilies = [
    'Roboto',
    'Noto Sans',
    'Noto Sans Telugu',
    'Noto Sans Devanagari',
    'sans-serif',
  ];

  static TextStyle get displayLarge => const TextStyle(
        fontFamilyFallback: fontFamilies,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
        height: 1.25,
      );

  static TextStyle get displayMedium => const TextStyle(
        fontFamilyFallback: fontFamilies,
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -0.3,
        height: 1.3,
      );

  static TextStyle get headingLarge => const TextStyle(
        fontFamilyFallback: fontFamilies,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.35,
      );

  static TextStyle get headingMedium => const TextStyle(
        fontFamilyFallback: fontFamilies,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get bodyLarge => const TextStyle(
        fontFamilyFallback: fontFamilies,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodyMedium => const TextStyle(
        fontFamilyFallback: fontFamilies,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodySmall => const TextStyle(
        fontFamilyFallback: fontFamilies,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  static TextStyle get labelLarge => const TextStyle(
        fontFamilyFallback: fontFamilies,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get labelMedium => const TextStyle(
        fontFamilyFallback: fontFamilies,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
        height: 1.3,
      );

  static TextStyle get questionText => const TextStyle(
        fontFamilyFallback: fontFamilies,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.45,
      );

  static TextStyle get optionText => const TextStyle(
        fontFamilyFallback: fontFamilies,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get explanationText => const TextStyle(
        fontFamilyFallback: fontFamilies,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.45,
      );
}
