class Subject {
  final String id;
  final String name;
  final String description;
  final String iconName;
  final int displayOrder;
  final bool isActive;

  const Subject({
    required this.id,
    required this.name,
    required this.description,
    required this.iconName,
    required this.displayOrder,
    this.isActive = true,
  });
}
