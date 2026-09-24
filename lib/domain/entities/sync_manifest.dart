class QuestionPackMetadata {
  final String id;
  final String subject;
  final String ageGroup;
  final int version;
  final int questionCount;
  final String url;
  final String? sha256;
  final String? releaseDate;

  const QuestionPackMetadata({
    required this.id,
    required this.subject,
    required this.ageGroup,
    required this.version,
    required this.questionCount,
    required this.url,
    this.sha256,
    this.releaseDate,
  });
}

class SyncManifest {
  final int version;
  final String? updatedAt;
  final List<QuestionPackMetadata> packs;

  const SyncManifest({
    required this.version,
    this.updatedAt,
    required this.packs,
  });
}
