import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_typography.dart';
import '../common/app_button.dart';
import '../common/app_card.dart';
import '../common/responsive_container.dart';
import '../providers/user_profile_provider.dart';
import 'subject_selection_screen.dart';

class AgeSelectionScreen extends ConsumerStatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  ConsumerState<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends ConsumerState<AgeSelectionScreen> {
  late String _selectedAgeGroup;

  final List<Map<String, dynamic>> _ageTiers = [
    {
      'id': AppConstants.ageGroup5to7,
      'title': '5–7',
      'label': 'Beginner',
      'accent': const Color(0xFFEA580C),
      'lightColor': const Color(0xFFFFF7ED),
      'description':
          'Friendly, visual questions with simple vocabulary and gentle topics.',
      'icon': Icons.sentiment_satisfied_alt_rounded,
    },
    {
      'id': AppConstants.ageGroup8to10,
      'title': '8–10',
      'label': 'Explorer',
      'accent': const Color(0xFF2563EB),
      'lightColor': const Color(0xFFEFF6FF),
      'description':
          'Curiosity-sparking facts, math puzzles, and elementary school topics.',
      'icon': Icons.explore_rounded,
    },
    {
      'id': AppConstants.ageGroup11to13,
      'title': '11–13',
      'label': 'Challenger',
      'accent': const Color(0xFF7C3AED),
      'lightColor': const Color(0xFFF5F3FF),
      'description':
          'Logic puzzles, science principles, and comprehensive deep questions.',
      'icon': Icons.psychology_rounded,
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedAgeGroup =
        ref.read(userProfileProvider)?.ageGroup ?? AppConstants.ageGroup8to10;
  }

  void _onContinue() {
    ref.read(userProfileProvider.notifier).updateAgeGroup(_selectedAgeGroup);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const SubjectSelectionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Step 2 of 3',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryDark,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ResponsiveContainer(
          maxWidth: 540,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How old are you?',
                style: AppTypography.displayMedium.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 26,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'We tailor the question difficulty to your learning stage. You can change this anytime.',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 14.5,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: _ageTiers.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final tier = _ageTiers[index];
                    final isSelected = _selectedAgeGroup == tier['id'];
                    final accentColor = tier['accent'] as Color;
                    final lightColor = tier['lightColor'] as Color;

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      child: AppCard(
                        borderColor: isSelected ? accentColor : AppColors.border,
                        borderWidth: isSelected ? 2.0 : 1.0,
                        backgroundColor:
                            isSelected ? lightColor : AppColors.surface,
                        padding: const EdgeInsets.all(18),
                        onTap: () {
                          setState(() {
                            _selectedAgeGroup = tier['id'] as String;
                          });
                        },
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? accentColor
                                    : AppColors.surfaceVariant,
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: accentColor
                                              .withValues(alpha: 0.3),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Icon(
                                tier['icon'] as IconData,
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.textPrimary,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        tier['title'] as String,
                                        style: AppTypography.headingMedium.copyWith(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? accentColor
                                              : AppColors.surfaceVariant,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          tier['label'] as String,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: isSelected
                                                ? Colors.white
                                                : AppColors.textSecondary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    tier['description'] as String,
                                    style: AppTypography.bodySmall.copyWith(
                                      height: 1.35,
                                      color: isSelected
                                          ? AppColors.textPrimary
                                          : AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? accentColor
                                    : Colors.transparent,
                                border: Border.all(
                                  color: isSelected
                                      ? accentColor
                                      : AppColors.border,
                                  width: 1.8,
                                ),
                              ),
                              child: isSelected
                                  ? const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              AppButton(
                label: 'Continue',
                icon: Icons.arrow_forward_rounded,
                onPressed: _onContinue,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
