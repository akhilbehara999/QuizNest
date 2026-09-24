import 'package:flutter/material.dart';

/// Minimal, calm educational color palette for QuizNest.
/// Avoids flashy arcade neon colors in favor of clear, accessible contrast.
class AppColors {
  AppColors._();

  // Backgrounds & Surfaces
  static const Color background = Color(0xFFF8FAFC); // Slate-50: Crisp, clean, minimal
  static const Color surface = Color(0xFFFFFFFF);    // Pure white for elevated cards
  static const Color surfaceVariant = Color(0xFFF1F5F9); // Slate-100: Soft chips/containers
  static const Color surfaceSubtle = Color(0xFFF8FAFC);

  // Primary Theme Colors (Calm Indigo / Royal Blue)
  static const Color primary = Color(0xFF2563EB);     // Blue-600: Friendly, accessible
  static const Color primaryDark = Color(0xFF1D4ED8); // Blue-700
  static const Color primaryLight = Color(0xFFEFF6FF);// Blue-50: Very soft, airy
  static const Color primaryBorder = Color(0xFFBFDBFE);// Blue-200

  // High-legibility Typography Colors
  static const Color textPrimary = Color(0xFF0F172A);  // Slate-900: High contrast, sharp
  static const Color textSecondary = Color(0xFF475569);// Slate-600: Balanced, readable
  static const Color textMuted = Color(0xFF94A3B8);    // Slate-400: Subtle labels

  // Borders & Dividers
  static const Color border = Color(0xFFE2E8F0);       // Slate-200: Subtle, minimal border
  static const Color borderLight = Color(0xFFF1F5F9);  // Slate-100
  static const Color borderFocused = Color(0xFF93C5FD);// Blue-300

  // Feedback states
  static const Color success = Color(0xFF16A34A);      // Green-600
  static const Color successLight = Color(0xFFDCFCE7); // Green-100
  static const Color successBorder = Color(0xFF86EFAC);// Green-300

  static const Color error = Color(0xFFDC2626);        // Red-600
  static const Color errorLight = Color(0xFFFEE2E2);   // Red-100
  static const Color errorBorder = Color(0xFFFCA5A5);  // Red-300

  static const Color warning = Color(0xFFD97706);      // Amber-600
  static const Color warningLight = Color(0xFFFEF3C7); // Amber-100

  static const Color star = Color(0xFFF59E0B);         // Amber-500: Golden star reward
  static const Color starLight = Color(0xFFFEF3C7);
}
