import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_typography.dart';
import '../common/app_button.dart';
import '../common/offline_status_indicator.dart';
import '../common/responsive_container.dart';
import '../common/safety_permission_dialog.dart';
import 'name_input_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Show safety and privacy permission disclosure once immediately after installation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SafetyPermissionDialog.showIfNeeded(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ResponsiveContainer(
          maxWidth: 520,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OfflineStatusIndicator(isOffline: true),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Modern 2026 App Logo Squircle with Ambient Glow
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF2563EB).withValues(alpha: 0.22),
                          blurRadius: 28,
                          offset: const Offset(0, 10),
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.asset(
                        'assets/images/app_logo.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.school_rounded,
                              color: AppColors.primary,
                              size: 46,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    AppConstants.appName,
                    style: AppTypography.displayLarge.copyWith(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.6,
                    ),
                    textAlign: TextAlign.center,
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
                      AppConstants.appTagline,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'A calm, educational trivia universe designed for curious young minds. Explore science, math, history, Telugu, Hindi, and more—100% offline.',
                    textAlign: TextAlign.center,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.55,
                      fontSize: 14.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Modern 2026 feature badges
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildFeatureBadge(Icons.wifi_off_rounded, '100% Offline'),
                      _buildFeatureBadge(Icons.auto_stories_rounded, '10 Subjects'),
                      _buildFeatureBadge(Icons.security_rounded, 'Child Safe'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  AppButton(
                    label: 'Get Started',
                    icon: Icons.arrow_forward_rounded,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const NameInputScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Zero tracking • Stored safely on this device',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureBadge(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.primary),
          const SizedBox(width: 7),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
