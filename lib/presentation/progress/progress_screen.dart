import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_typography.dart';
import '../common/app_card.dart';
import '../common/responsive_container.dart';
import '../providers/progress_provider.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressAsync = ref.watch(overallProgressProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Your Learning Progress'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ResponsiveContainer(
          maxWidth: 620,
          child: progressAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text('Error loading progress: $err')),
            data: (summary) {
              return RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(overallProgressProvider);
                },
                child: ListView(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 96),
                  children: [
                    // Stars Hero Card
                    Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFFFBEB),
                            Color(0xFFFEF3C7),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: const Color(0xFFFDE68A),
                          width: 1.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFD97706).withValues(alpha: 0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x15D97706),
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: const Icon(Icons.star_rounded,
                                    color: AppColors.star, size: 36),
                              ),
                              const SizedBox(width: 14),
                              Text(
                                '${summary.totalStars} Stars',
                                style: const TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF92400E),
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.9),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildStatItem(
                                  label: 'Answered',
                                  value: '${summary.totalAnswered}',
                                ),
                                Container(
                                    width: 1,
                                    height: 32,
                                    color: const Color(0xFFFDE68A)),
                                _buildStatItem(
                                  label: 'Correct',
                                  value: '${summary.totalCorrect}',
                                ),
                                Container(
                                    width: 1,
                                    height: 32,
                                    color: const Color(0xFFFDE68A)),
                                _buildStatItem(
                                  label: 'Accuracy',
                                  value:
                                      '${summary.overallAccuracy.toStringAsFixed(0)}%',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    Text(
                      'Subject Mastery',
                      style: AppTypography.headingLarge.copyWith(
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...SubjectConfig.predefinedSubjects.map((sub) {
                      final data = summary.subjectProgress[sub.id];
                      final answered = data?.totalAnswered ?? 0;
                      final accuracy = data?.accuracy ?? 0.0;
                      final progressFrac = (accuracy / 100).clamp(0.0, 1.0);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: AppCard(
                          borderRadius: 18,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: sub.lightColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: sub.accentColor
                                            .withValues(alpha: 0.15),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Icon(sub.icon,
                                        color: sub.accentColor, size: 20),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      sub.name,
                                      style: AppTypography.labelLarge.copyWith(
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: answered > 0
                                          ? sub.lightColor
                                          : AppColors.surfaceVariant,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      answered > 0
                                          ? '${accuracy.toStringAsFixed(0)}% Mastery'
                                          : 'Not started',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: answered > 0
                                            ? sub.accentColor
                                            : AppColors.textMuted,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: LinearProgressIndicator(
                                  value: answered > 0 ? progressFrac : 0.0,
                                  minHeight: 7,
                                  backgroundColor: AppColors.border,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      sub.accentColor),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    answered > 0
                                        ? '$answered questions answered'
                                        : '100+ questions ready',
                                    style: AppTypography.bodySmall,
                                  ),
                                  if (answered > 0)
                                    Text(
                                      '${data?.starPoints ?? 0} ⭐ earned',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.star,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem({required String label, required String value}) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
