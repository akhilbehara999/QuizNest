import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_typography.dart';
import '../common/app_button.dart';
import '../common/app_card.dart';
import '../common/responsive_container.dart';
import '../home/home_screen.dart';
import '../providers/user_profile_provider.dart';

class SubjectSelectionScreen extends ConsumerStatefulWidget {
  final bool isSettingsMode;

  const SubjectSelectionScreen({
    super.key,
    this.isSettingsMode = false,
  });

  @override
  ConsumerState<SubjectSelectionScreen> createState() =>
      _SubjectSelectionScreenState();
}

class _SubjectSelectionScreenState
    extends ConsumerState<SubjectSelectionScreen> {
  late Set<String> _selectedSubjects;

  @override
  void initState() {
    super.initState();
    final profile = ref.read(userProfileProvider);
    _selectedSubjects = Set<String>.from(profile?.selectedSubjects ?? ['science', 'math']);
  }

  void _toggleSubject(String id) {
    setState(() {
      if (_selectedSubjects.contains(id)) {
        if (_selectedSubjects.length > 1) {
          _selectedSubjects.remove(id);
        }
      } else {
        _selectedSubjects.add(id);
      }
    });
  }

  Future<void> _onFinish() async {
    for (final s in SubjectConfig.predefinedSubjects) {
      final shouldBeSelected = _selectedSubjects.contains(s.id);
      final isCurrentlySelected =
          ref.read(userProfileProvider)?.selectedSubjects.contains(s.id) ?? false;
      if (shouldBeSelected != isCurrentlySelected) {
        ref.read(userProfileProvider.notifier).toggleSubject(s.id);
      }
    }

    if (widget.isSettingsMode) {
      await ref.read(userProfileProvider.notifier).saveProfile();
      if (mounted) Navigator.of(context).pop();
    } else {
      await ref.read(userProfileProvider.notifier).completeOnboarding();
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final subjects = SubjectConfig.predefinedSubjects;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: ResponsiveContainer(
          maxWidth: 620,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose your subjects',
                style: AppTypography.displayMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Pick subjects you want to explore first. You can always change them later.',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${_selectedSubjects.length} of ${subjects.length} selected',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (_selectedSubjects.length == subjects.length) {
                          _selectedSubjects = {subjects.first.id};
                        } else {
                          _selectedSubjects = subjects.map((s) => s.id).toSet();
                        }
                      });
                    },
                    child: Text(
                      _selectedSubjects.length == subjects.length ? 'Reset' : 'Select All',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = constraints.maxWidth > 500 ? 3 : 2;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: crossAxisCount == 3 ? 1.15 : 1.35,
                      ),
                      itemCount: subjects.length,
                      itemBuilder: (context, index) {
                        final subject = subjects[index];
                        final isSelected = _selectedSubjects.contains(subject.id);

                        return AppCard(
                          backgroundColor: isSelected
                              ? subject.lightColor
                              : AppColors.surface,
                          borderColor:
                              isSelected ? subject.accentColor : AppColors.border,
                          borderWidth: isSelected ? 1.8 : 1.0,
                          padding: const EdgeInsets.all(14),
                          onTap: () => _toggleSubject(subject.id),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 38,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.white
                                          : subject.lightColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      subject.icon,
                                      color: subject.accentColor,
                                      size: 22,
                                    ),
                                  ),
                                  Icon(
                                    isSelected
                                        ? Icons.check_circle_rounded
                                        : Icons.circle_outlined,
                                    color: isSelected
                                        ? subject.accentColor
                                        : AppColors.border,
                                    size: 22,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    subject.name,
                                    style: AppTypography.labelLarge.copyWith(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 2),
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
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 14),
              AppButton(
                label: widget.isSettingsMode ? 'Save Preferences' : 'Start QuizNest',
                icon: widget.isSettingsMode ? Icons.check_rounded : Icons.arrow_forward_rounded,
                onPressed: _selectedSubjects.isNotEmpty ? _onFinish : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
