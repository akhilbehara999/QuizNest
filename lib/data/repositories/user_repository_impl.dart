import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/user_repository.dart';
import '../database/app_database.dart';

class UserRepositoryImpl implements UserRepository {
  final AppDatabase _db;
  final SharedPreferences _prefs;

  static const String _defaultUserId = 'current_kid_profile';

  UserRepositoryImpl(this._db, this._prefs);

  @override
  Future<UserProfile?> getUserProfile() async {
    final query = _db.select(_db.userProfiles)
      ..where((tbl) => tbl.id.equals(_defaultUserId));
    final entry = await query.getSingleOrNull();

    if (entry == null) {
      // Check SharedPreferences fallback
      final name = _prefs.getString(AppConstants.prefKeyUserName);
      final ageGroup = _prefs.getString(AppConstants.prefKeyUserAgeGroup);
      final subjects = _prefs.getStringList(AppConstants.prefKeyUserSelectedSubjects);

      if (name != null && ageGroup != null) {
        return UserProfile(
          id: _defaultUserId,
          name: name,
          ageGroup: ageGroup,
          selectedSubjects: subjects ?? ['science', 'math'],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      }
      return null;
    }

    final List<dynamic> subjectsList = jsonDecode(entry.selectedSubjectsJson);
    return UserProfile(
      id: entry.id,
      name: entry.name,
      ageGroup: entry.ageGroup,
      selectedSubjects: subjectsList.map((e) => e.toString()).toList(),
      createdAt: entry.createdAt,
      updatedAt: entry.updatedAt,
    );
  }

  @override
  Future<void> saveUserProfile(UserProfile profile) async {
    final companion = UserProfilesCompanion.insert(
      id: _defaultUserId,
      name: profile.name,
      ageGroup: profile.ageGroup,
      selectedSubjectsJson: jsonEncode(profile.selectedSubjects),
      createdAt: profile.createdAt,
      updatedAt: profile.updatedAt,
    );

    await _db.into(_db.userProfiles).insertOnConflictUpdate(companion);

    // Sync to SharedPreferences for fast access
    await _prefs.setString(AppConstants.prefKeyUserName, profile.name);
    await _prefs.setString(AppConstants.prefKeyUserAgeGroup, profile.ageGroup);
    await _prefs.setStringList(
        AppConstants.prefKeyUserSelectedSubjects, profile.selectedSubjects);
  }

  @override
  Future<bool> isOnboardingCompleted() async {
    return _prefs.getBool(AppConstants.prefKeyOnboardingCompleted) ?? false;
  }

  @override
  Future<void> setOnboardingCompleted(bool completed) async {
    await _prefs.setBool(AppConstants.prefKeyOnboardingCompleted, completed);
  }
}
