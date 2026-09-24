import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_typography.dart';
import '../common/app_button.dart';
import '../common/app_card.dart';
import '../common/responsive_container.dart';
import '../onboarding/subject_selection_screen.dart';
import '../providers/sync_provider.dart';
import '../providers/user_profile_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  void _showAgeGroupDialog(BuildContext context, WidgetRef ref) {
    final currentAge =
        ref.read(userProfileProvider)?.ageGroup ?? AppConstants.ageGroup8to10;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Change Learning Stage'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: AppConstants.allAgeGroups.map((age) {
            final isSelected = currentAge == age;
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryLight : AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  width: 1.5,
                ),
              ),
              child: ListTile(
                title: Text(
                  '${AppConstants.getAgeGroupTitle(age)} (${AppConstants.getAgeGroupSubtitle(age)})',
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected ? AppColors.primaryDark : AppColors.textPrimary,
                  ),
                ),
                trailing: isSelected
                    ? const Icon(Icons.check_circle_rounded, color: AppColors.primary)
                    : null,
                onTap: () {
                  ref.read(userProfileProvider.notifier).updateAgeGroup(age);
                  ref.read(userProfileProvider.notifier).saveProfile();
                  Navigator.of(ctx).pop();
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showNameEditDialog(BuildContext context, WidgetRef ref) {
    final currentProfile = ref.read(userProfileProvider);
    final rawName = currentProfile?.name ?? '';
    final List<String> avatars = ['🦉', '🦁', '🚀', '🐬', '🦊', '🎨', '🌟', '🐼'];
    String selectedAvatar = '🦉';
    String cleanName = rawName;
    for (final a in avatars) {
      if (rawName.startsWith(a)) {
        selectedAvatar = a;
        cleanName = rawName.substring(a.length).trim();
        break;
      }
    }
    final textController = TextEditingController(text: cleanName);

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text('Edit Profile Name'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: avatars.map((a) {
                    final isSel = selectedAvatar == a;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: InkWell(
                        onTap: () {
                          setDialogState(() {
                            selectedAvatar = a;
                          });
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: isSel ? AppColors.primaryLight : AppColors.surfaceVariant,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSel ? AppColors.primary : Colors.transparent,
                              width: 1.5,
                            ),
                          ),
                          child: Text(a, style: const TextStyle(fontSize: 22)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: textController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: 'Your Name',
                  hintText: 'Enter name',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final newName = textController.text.trim();
                if (newName.isNotEmpty) {
                  ref
                      .read(userProfileProvider.notifier)
                      .updateName('$selectedAvatar $newName');
                  ref.read(userProfileProvider.notifier).saveProfile();
                }
                Navigator.of(ctx).pop();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);
    final syncState = ref.watch(syncProvider);
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

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Settings & Preferences'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ResponsiveContainer(
          maxWidth: 620,
          child: ListView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 96),
            children: [
              Text('Learner Profile', style: AppTypography.headingMedium.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: -0.3,
              )),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primaryBorder, width: 1.5),
                          ),
                          alignment: Alignment.center,
                          child: Text(avatarIcon, style: const TextStyle(fontSize: 24)),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cleanName,
                                style: AppTypography.labelLarge.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Age $ageTitle ($ageSubtitle) • ${profile?.selectedSubjects.length ?? 0} active subjects',
                                style: AppTypography.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit_outlined, size: 20),
                          tooltip: 'Edit Name',
                          onPressed: () => _showNameEditDialog(context, ref),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Divider(),
                    const SizedBox(height: 6),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.cake_outlined, color: AppColors.primary),
                      title: const Text('Age Stage', style: TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: Text('$ageTitle • $ageSubtitle'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => _showAgeGroupDialog(context, ref),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.tune_rounded, color: AppColors.primary),
                      title: const Text('Favorite Subjects', style: TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: const Text('Customize subjects shown on home'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SubjectSelectionScreen(
                              isSettingsMode: true,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text('Content & Synchronization', style: AppTypography.headingMedium),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Automatic Updates', style: TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: const Text('Check for new questions when online'),
                      value: syncState.autoSyncEnabled,
                      activeThumbColor: AppColors.primary,
                      onChanged: (val) {
                        ref.read(syncProvider.notifier).toggleAutoSync(val);
                      },
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Download on Wi-Fi Only', style: TextStyle(fontWeight: FontWeight.w600)),
                      subtitle: const Text('Conserve mobile data when updating'),
                      value: syncState.wifiOnly,
                      activeThumbColor: AppColors.primary,
                      onChanged: (val) {
                        ref.read(syncProvider.notifier).toggleWifiOnly(val);
                      },
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Offline Questions', style: TextStyle(fontSize: 14)),
                        const Text(
                          '1,020 ready',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryDark),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Content Version', style: TextStyle(fontSize: 14)),
                        Text(
                          'Pack v${syncState.localManifestVersion}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Last Checked', style: TextStyle(fontSize: 14)),
                        Text(
                          syncState.lastSyncTime != null
                              ? '${syncState.lastSyncTime!.hour.toString().padLeft(2, '0')}:${syncState.lastSyncTime!.minute.toString().padLeft(2, '0')}'
                              : 'Offline (Bundled)',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    // Modern 2026 Auto-Replenish Status Card (No manual download button)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFBBF7D0), width: 1.2),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: syncState.isSyncing
                                  ? AppColors.warning
                                  : const Color(0xFF22C55E),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: (syncState.isSyncing
                                          ? AppColors.warning
                                          : const Color(0xFF22C55E))
                                      .withValues(alpha: 0.45),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      syncState.isSyncing
                                          ? 'Replenishing in Background...'
                                          : 'Auto-Replenish Active',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF166534),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.bolt_rounded,
                                      size: 16,
                                      color: Color(0xFF16A34A),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  syncState.isSyncing
                                      ? 'Downloading fresh questions silently...'
                                      : 'Automatically replaces solved questions with fresh ones whenever internet is connected.',
                                  style: const TextStyle(
                                    fontSize: 11.5,
                                    color: Color(0xFF15803D),
                                    height: 1.35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text('Developer & Creator', style: AppTypography.headingMedium),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2563EB), Color(0xFF4F46E5)],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF2563EB).withValues(alpha: 0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.code_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Akhil',
                                style: AppTypography.labelLarge.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                'Lead Developer & Creator',
                                style: TextStyle(
                                  fontSize: 12.5,
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.primaryBorder, width: 1),
                          ),
                          child: const Text(
                            'Author',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 12),
                    // Portfolio Link Card
                    InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        Clipboard.setData(
                          const ClipboardData(
                            text: 'https://akhil-portfolio-rho.vercel.app/',
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Portfolio link copied: https://akhil-portfolio-rho.vercel.app/',
                            ),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.primaryBorder, width: 1.2),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.language_rounded,
                                color: AppColors.primary,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Developer Portfolio',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'akhil-portfolio-rho.vercel.app',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryDark,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.copy_rounded,
                              size: 16,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text('Privacy & About', style: AppTypography.headingMedium),
              const SizedBox(height: 12),
              AppCard(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.shield_outlined,
                            color: AppColors.success, size: 22),
                        const SizedBox(width: 8),
                        Text(
                          '100% On-Device Privacy',
                          style: AppTypography.labelLarge.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'QuizNest does not collect, track, or upload any personal kid info, answers, or analytics. Everything stays strictly inside local SQLite on this device.',
                      style: AppTypography.bodySmall.copyWith(
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Divider(),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppConstants.appName,
                          style: AppTypography.labelMedium.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          'v1.0.0 (Offline 2026 Edition)',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
