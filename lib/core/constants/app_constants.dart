import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const String appName = 'QuizNest';
  static const String appTagline = 'Learn • Think • Play';

  // Age Groups
  static const String ageGroup5to7 = '5-7';
  static const String ageGroup8to10 = '8-10';
  static const String ageGroup11to13 = '11-13';

  static const List<String> allAgeGroups = [
    ageGroup5to7,
    ageGroup8to10,
    ageGroup11to13,
  ];

  static String getAgeGroupTitle(String ageGroup) {
    switch (ageGroup) {
      case ageGroup5to7:
        return '5–7';
      case ageGroup8to10:
        return '8–10';
      case ageGroup11to13:
        return '11–13';
      default:
        return ageGroup;
    }
  }

  static String getAgeGroupSubtitle(String ageGroup) {
    switch (ageGroup) {
      case ageGroup5to7:
        return 'Beginner';
      case ageGroup8to10:
        return 'Explorer';
      case ageGroup11to13:
        return 'Challenger';
      default:
        return 'Learner';
    }
  }

  // Default quiz configuration
  static const int defaultQuestionsPerQuiz = 10;
  static const int pointsPerCorrectAnswer = 10;

  // Remote Static Content Distribution configuration
  // Configurable URL pointing to static CDN / GitHub raw releases
  static const String defaultRemoteBaseUrl =
      'https://raw.githubusercontent.com/quiznest/quiznest-content/main';
  static const String manifestFileName = 'manifest.json';

  // SharedPreferences Keys
  static const String prefKeyOnboardingCompleted = 'onboarding_completed';
  static const String prefKeyUserName = 'user_name';
  static const String prefKeyUserAgeGroup = 'user_age_group';
  static const String prefKeyUserSelectedSubjects = 'user_selected_subjects';
  static const String prefKeyAutoSyncEnabled = 'auto_sync_enabled';
  static const String prefKeyWifiOnly = 'wifi_only_sync';
  static const String prefKeyLastSyncTime = 'last_sync_time';
  static const String prefKeySafetyPermissionAccepted = 'safety_permission_accepted';
  static const String prefKeyRemoteBaseUrl = 'remote_base_url';
}

/// Subject model definition and static catalog of supported subjects.
class SubjectConfig {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final Color accentColor;
  final Color lightColor;

  const SubjectConfig({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    this.accentColor = const Color(0xFF2563EB),
    this.lightColor = const Color(0xFFEFF6FF),
  });

  static const List<SubjectConfig> predefinedSubjects = [
    SubjectConfig(
      id: 'science',
      name: 'Science',
      description: 'Discover how nature, chemistry, physics, and planets work.',
      icon: Icons.science_outlined,
      accentColor: Color(0xFF0D9488), // Teal
      lightColor: Color(0xFFF0FDFA),
    ),
    SubjectConfig(
      id: 'math',
      name: 'Math',
      description: 'Numbers, arithmetic, shapes, logic, and puzzles.',
      icon: Icons.calculate_outlined,
      accentColor: Color(0xFF2563EB), // Blue
      lightColor: Color(0xFFEFF6FF),
    ),
    SubjectConfig(
      id: 'english',
      name: 'English',
      description: 'Vocabulary, grammar, spelling, and sentence building.',
      icon: Icons.menu_book_outlined,
      accentColor: Color(0xFFD97706), // Amber
      lightColor: Color(0xFFFFFBEB),
    ),
    SubjectConfig(
      id: 'general_knowledge',
      name: 'General Knowledge',
      description: 'Fascinating global facts, inventions, and curiosities.',
      icon: Icons.public_outlined,
      accentColor: Color(0xFF7C3AED), // Purple
      lightColor: Color(0xFFF5F3FF),
    ),
    SubjectConfig(
      id: 'history',
      name: 'History',
      description: 'Ancient monuments, great leaders, and historical milestones.',
      icon: Icons.history_edu_outlined,
      accentColor: Color(0xFFE11D48), // Rose
      lightColor: Color(0xFFFFF1F2),
    ),
    SubjectConfig(
      id: 'geography',
      name: 'Geography',
      description: 'Continents, oceans, mountains, countries, and maps.',
      icon: Icons.map_outlined,
      accentColor: Color(0xFF0284C7), // Sky Blue
      lightColor: Color(0xFFF0F9FF),
    ),
    SubjectConfig(
      id: 'computers',
      name: 'Computers',
      description: 'Hardware, software, coding concepts, and digital safety.',
      icon: Icons.computer_outlined,
      accentColor: Color(0xFF4F46E5), // Indigo
      lightColor: Color(0xFFEEF2FF),
    ),
    SubjectConfig(
      id: 'animals',
      name: 'Animals',
      description: 'Wildlife, ocean creatures, birds, and animal behaviors.',
      icon: Icons.pets_outlined,
      accentColor: Color(0xFF16A34A), // Emerald Green
      lightColor: Color(0xFFF0FDF4),
    ),
    SubjectConfig(
      id: 'telugu',
      name: 'Telugu',
      description: 'తెలుగు భాష, అక్షరాలు, పదాలు, సాహిత్యం, సంస్కృతి.',
      icon: Icons.translate_outlined,
      accentColor: Color(0xFFEA580C), // Warm Orange
      lightColor: Color(0xFFFFF7ED),
    ),
    SubjectConfig(
      id: 'hindi',
      name: 'Hindi',
      description: 'हिन्दी भाषा, वर्णमाला, व्याकरण, शब्द और रोचक ज्ञान।',
      icon: Icons.auto_stories_outlined,
      accentColor: Color(0xFFDB2777), // Berry Pink
      lightColor: Color(0xFFFDF2F8),
    ),
  ];

  static SubjectConfig? findById(String id) {
    try {
      return predefinedSubjects.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }
}
