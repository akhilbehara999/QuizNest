import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/entities/user_profile.dart';
import 'core_providers.dart';

class UserProfileNotifier extends Notifier<UserProfile?> {
  @override
  UserProfile? build() {
    Future.microtask(() => _loadProfile());
    return null;
  }

  Future<void> _loadProfile() async {
    final repo = ref.read(userRepositoryProvider);
    final profile = await repo.getUserProfile();
    state = profile ??
        UserProfile(
          id: 'current_kid_profile',
          name: '',
          ageGroup: AppConstants.ageGroup5to7,
          selectedSubjects: const ['science', 'math'],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
  }

  void updateName(String name) {
    if (state == null) return;
    state = state!.copyWith(name: name.trim());
  }

  void updateAgeGroup(String ageGroup) {
    if (state == null) return;
    state = state!.copyWith(ageGroup: ageGroup);
  }

  void toggleSubject(String subjectId) {
    if (state == null) return;
    final current = List<String>.from(state!.selectedSubjects);
    if (current.contains(subjectId)) {
      if (current.length > 1) {
        current.remove(subjectId);
      }
    } else {
      current.add(subjectId);
    }
    state = state!.copyWith(selectedSubjects: current);
  }

  Future<void> saveProfile() async {
    if (state == null) return;
    final repo = ref.read(userRepositoryProvider);
    await repo.saveUserProfile(state!);
  }

  Future<void> completeOnboarding() async {
    await saveProfile();
    final repo = ref.read(userRepositoryProvider);
    await repo.setOnboardingCompleted(true);
  }
}

final userProfileProvider =
    NotifierProvider<UserProfileNotifier, UserProfile?>(UserProfileNotifier.new);
