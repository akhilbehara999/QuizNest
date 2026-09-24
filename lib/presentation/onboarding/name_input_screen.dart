import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../common/app_button.dart';
import '../common/responsive_container.dart';
import '../providers/user_profile_provider.dart';
import 'age_selection_screen.dart';

class NameInputScreen extends ConsumerStatefulWidget {
  const NameInputScreen({super.key});

  @override
  ConsumerState<NameInputScreen> createState() => _NameInputScreenState();
}

class _NameInputScreenState extends ConsumerState<NameInputScreen> {
  late final TextEditingController _nameController;
  final List<String> _avatars = ['🦉', '🦁', '🚀', '🐬', '🦊', '🎨', '🌟', '🐼'];
  String _selectedAvatar = '🦉';

  @override
  void initState() {
    super.initState();
    final currentName = ref.read(userProfileProvider)?.name ?? '';
    if (currentName.isNotEmpty) {
      for (final a in _avatars) {
        if (currentName.startsWith(a)) {
          _selectedAvatar = a;
          _nameController = TextEditingController(
              text: currentName.substring(a.length).trim());
          return;
        }
      }
    }
    _nameController = TextEditingController(text: currentName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onContinue() {
    final rawName = _nameController.text.trim();
    if (rawName.isEmpty) return;

    final fullName = '$_selectedAvatar $rawName';
    ref.read(userProfileProvider.notifier).updateName(fullName);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AgeSelectionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isValid = _nameController.text.trim().isNotEmpty;

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
                'Step 1 of 3',
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
          maxWidth: 520,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What should we call you?',
                style: AppTypography.displayMedium.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 26,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Pick a friendly companion avatar and enter your learner name.',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 14.5,
                ),
              ),
              const SizedBox(height: 28),
              // Modern 2026 Avatar Hero Card
              Center(
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOutBack,
                      width: 92,
                      height: 92,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: AppColors.primary, width: 2.2),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.18),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _selectedAvatar,
                        style: const TextStyle(fontSize: 46),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Tap an avatar below to switch',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Avatars Row with Modern Pill/Squircle Tiles
              Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: _avatars.map((avatar) {
                    final isSelected = _selectedAvatar == avatar;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedAvatar = avatar;
                        });
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        width: 48,
                        height: 48,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primaryLight
                              : AppColors.surface,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.border,
                            width: isSelected ? 2.0 : 1.0,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: AppColors.primary
                                        .withValues(alpha: 0.15),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : null,
                        ),
                        child: Text(
                          avatar,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 32),
              // Modern 2026 Floating Input Card
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isValid
                        ? AppColors.primary
                        : AppColors.border,
                    width: isValid ? 1.8 : 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextField(
                  controller: _nameController,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  style: AppTypography.headingMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Enter your name (e.g. Maya)',
                    hintStyle: TextStyle(
                      color: AppColors.textMuted.withValues(alpha: 0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: const Icon(
                      Icons.person_rounded,
                      color: AppColors.primary,
                      size: 22,
                    ),
                    suffixIcon: _nameController.text.trim().isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear_rounded, size: 20),
                            onPressed: () {
                              _nameController.clear();
                              setState(() {});
                            },
                          )
                        : null,
                  ),
                  onSubmitted: (_) => _onContinue(),
                  onChanged: (_) => setState(() {}),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.shield_outlined,
                      size: 14, color: AppColors.success),
                  const SizedBox(width: 6),
                  Text(
                    'Stored safely on this device. Never uploaded.',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              AppButton(
                label: 'Continue',
                icon: Icons.arrow_forward_rounded,
                onPressed: isValid ? _onContinue : null,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
