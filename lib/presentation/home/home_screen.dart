import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_typography.dart';
import '../common/app_card.dart';
import '../common/offline_status_indicator.dart';
import '../common/pill_bottom_navigation_bar.dart';
import '../common/responsive_container.dart';
import '../progress/progress_screen.dart';
import '../quiz/quiz_screen.dart';
import '../providers/progress_provider.dart';
import '../providers/quiz_provider.dart';
import '../providers/sync_provider.dart';
import '../providers/user_profile_provider.dart';
import '../settings/settings_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Silently auto-replenish solved questions in the background whenever internet is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(syncProvider.notifier).triggerSync(userInitiated: false);
    });
  }

  void _startQuizForSubject(String subjectId) {
    final profile = ref.read(userProfileProvider);
    final ageGroup = profile?.ageGroup ?? AppConstants.ageGroup8to10;

    ref.read(quizProvider.notifier).startQuiz(
          subjectId: subjectId,
          ageGroup: ageGroup,
        );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const QuizScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: [
              _buildHomeTab(),
              const ProgressScreen(),
              const SettingsScreen(),
            ],
          ),
          PillBottomNavigationBar(
            currentIndex: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              PillNavItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home_rounded,
                label: 'Home',
              ),
              PillNavItem(
                icon: Icons.insights_outlined,
                activeIcon: Icons.insights_rounded,
                label: 'Progress',
              ),
              PillNavItem(
                icon: Icons.settings_outlined,
                activeIcon: Icons.settings_rounded,
                label: 'Settings',
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildHomeTab() {
    final profile = ref.watch(userProfileProvider);
    final activeSessionAsync = ref.watch(activeSessionProvider);
    final progressAsync = ref.watch(overallProgressProvider);
    final rawName = profile?.name.isNotEmpty == true ? profile!.name : 'Friend';

    String avatarIcon = '🦉';
    String cleanName = rawName;
    for (final a in ['🦉', '🦁', '🚀', '🐬', '🦊', '🎨', '🌟', '🐼']) {
      if (rawName.startsWith(a)) {
        avatarIcon = a;
        cleanName = rawName.substring(a.length).trim();
        break;
      }
    }
    if (cleanName.isEmpty) cleanName = 'Learner';

    final ageTitle = AppConstants.getAgeGroupTitle(
        profile?.ageGroup ?? AppConstants.ageGroup8to10);
    final ageSubtitle = AppConstants.getAgeGroupSubtitle(
        profile?.ageGroup ?? AppConstants.ageGroup8to10);

    final subjects = SubjectConfig.predefinedSubjects;

    return SafeArea(
      child: ResponsiveContainer(
        maxWidth: 620,
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(activeSessionProvider);
            ref.invalidate(overallProgressProvider);
          },
          child: ListView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 96),
            children: [
              // User Greeting Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryBorder,
                        width: 1.5,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      avatarIcon,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hi, $cleanName 👋',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.headingLarge.copyWith(
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.3,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceVariant,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Age $ageTitle • $ageSubtitle',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      progressAsync.when(
                        data: (summary) => Container(
                          margin: const EdgeInsets.only(right: 6),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.starLight,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: const Color(0xFFFDE68A),
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star_rounded,
                                  color: AppColors.star, size: 15),
                              const SizedBox(width: 3),
                              Text(
                                '${summary.totalStars}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFFB45309),
                                ),
                              ),
                            ],
                          ),
                        ),
                        loading: () => const SizedBox.shrink(),
                        error: (_, _) => const SizedBox.shrink(),
                      ),
                      const OfflineStatusIndicator(isOffline: true),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Continue Quiz Card (if active in-progress session exists)
              activeSessionAsync.when(
                data: (activeSession) {
                  if (activeSession == null) return const SizedBox.shrink();
                  final subConfig =
                      SubjectConfig.findById(activeSession.subjectId);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: AppCard(
                      backgroundColor: AppColors.primaryLight,
                      borderColor: AppColors.primaryBorder,
                      onTap: () =>
                          _startQuizForSubject(activeSession.subjectId),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(Icons.play_arrow_rounded,
                                color: Colors.white, size: 28),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'RESUME QUIZ',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.primaryDark,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  subConfig?.name ?? 'Trivia Challenge',
                                  style: AppTypography.labelLarge.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_rounded,
                              size: 18, color: AppColors.primary),
                        ],
                      ),
                    ),
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (err, stack) => const SizedBox.shrink(),
              ),

              // Modern 2026 Quick Challenge Hero Banner
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFEFF6FF),
                      Color(0xFFF5F3FF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: const Color(0xFFDBEAFE),
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2563EB).withValues(alpha: 0.05),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(22),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(22),
                    onTap: () {
                      final favorite = profile?.selectedSubjects.isNotEmpty == true
                          ? profile!.selectedSubjects.first
                          : 'science';
                      _startQuizForSubject(favorite);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withValues(alpha: 0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.bolt_rounded,
                                color: Colors.white, size: 28),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Quick 10-Question Quiz',
                                  style: AppTypography.labelLarge.copyWith(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                    letterSpacing: -0.2,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text(
                                  'Bite-sized challenge to test your skills',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFE2E8F0),
                                width: 1.0,
                              ),
                            ),
                            child: const Icon(Icons.play_arrow_rounded,
                                color: AppColors.primary, size: 22),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 26),

              // Subjects Catalog Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore Subjects',
                    style: AppTypography.headingLarge.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceVariant,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${subjects.length} Subjects',
                      style: AppTypography.bodySmall.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Responsive Grid of Subjects with themed modern cards
              LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.maxWidth > 500 ? 3 : 2;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: crossAxisCount == 3 ? 1.05 : 1.15,
                    ),
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      final sub = subjects[index];
                      return AppCard(
                        padding: const EdgeInsets.all(14),
                        borderRadius: 18,
                        onTap: () => _startQuizForSubject(sub.id),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: sub.lightColor,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: sub.accentColor.withValues(alpha: 0.15),
                                  width: 1.0,
                                ),
                              ),
                              child: Icon(sub.icon,
                                  color: sub.accentColor, size: 22),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sub.name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textPrimary,
                                    letterSpacing: -0.2,
                                    height: 1.2,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Container(
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: sub.accentColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      '100+ questions',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textMuted,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
