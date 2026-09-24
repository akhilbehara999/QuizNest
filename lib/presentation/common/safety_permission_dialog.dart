import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_typography.dart';
import 'app_button.dart';

/// Modal dialog presented once upon first installation to disclose
/// on-device privacy, safe network access, and zero-tracking commitment.
class SafetyPermissionDialog extends StatelessWidget {
  const SafetyPermissionDialog({super.key});

  /// Check if the safety permission has already been acknowledged.
  /// If not, displays the dialog and records acceptance in SharedPreferences.
  static Future<void> showIfNeeded(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final accepted = prefs.getBool(AppConstants.prefKeySafetyPermissionAccepted) ?? false;
    if (!accepted && context.mounted) {
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (_) => const SafetyPermissionDialog(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 480),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.16),
              blurRadius: 32,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            // Safe Guardian Shield Icon
            Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFBBF7D0), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF22C55E).withValues(alpha: 0.2),
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.verified_user_rounded,
                color: Color(0xFF16A34A),
                size: 34,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Safety & Child Privacy',
              style: AppTypography.headingLarge.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.3,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              'Your learning environment is 100% safe, calm, and private.',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Safety Points
            _buildSafetyPoint(
              icon: Icons.lock_outline_rounded,
              iconColor: AppColors.primary,
              iconBg: AppColors.primaryLight,
              title: '100% On-Device Privacy',
              description:
                  'No personal data, kid names, or quiz scores ever leave this device. Everything stays inside local SQLite.',
            ),
            const SizedBox(height: 12),
            _buildSafetyPoint(
              icon: Icons.wifi_protected_setup_rounded,
              iconColor: const Color(0xFF0D9488),
              iconBg: const Color(0xFFF0FDFA),
              title: 'Safe Automatic Background Updates',
              description:
                  'We only use internet access to automatically replenish fresh questions when online. Zero ads, trackers, or cookies.',
            ),
            const SizedBox(height: 12),
            _buildSafetyPoint(
              icon: Icons.family_restroom_rounded,
              iconColor: const Color(0xFFEA580C),
              iconBg: const Color(0xFFFFF7ED),
              title: 'Zero Intrusive Permissions',
              description:
                  'No camera, microphone, contacts, location, or sensitive OS permissions required. Safe for all ages.',
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'Accept & Continue Learning',
              icon: Icons.check_circle_rounded,
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool(
                    AppConstants.prefKeySafetyPermissionAccepted, true);
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Compliant with COPPA & Child-Safe Mobile Standards',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildSafetyPoint({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border, width: 1.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 11.5,
                    color: AppColors.textSecondary,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
