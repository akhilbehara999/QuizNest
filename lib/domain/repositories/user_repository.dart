import '../entities/user_profile.dart';

abstract class UserRepository {
  Future<UserProfile?> getUserProfile();

  Future<void> saveUserProfile(UserProfile profile);

  Future<bool> isOnboardingCompleted();

  Future<void> setOnboardingCompleted(bool completed);
}
