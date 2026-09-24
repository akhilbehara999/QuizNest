class UserProfile {
  final String id;
  final String name;
  final String ageGroup;
  final List<String> selectedSubjects;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserProfile({
    required this.id,
    required this.name,
    required this.ageGroup,
    required this.selectedSubjects,
    required this.createdAt,
    required this.updatedAt,
  });

  UserProfile copyWith({
    String? name,
    String? ageGroup,
    List<String>? selectedSubjects,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      id: id,
      name: name ?? this.name,
      ageGroup: ageGroup ?? this.ageGroup,
      selectedSubjects: selectedSubjects ?? this.selectedSubjects,
      createdAt: createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
