import '../../domain/entities/sync_manifest.dart';

class SyncManifestDto {
  final int version;
  final String? updatedAt;
  final List<QuestionPackMetadataDto> packs;

  const SyncManifestDto({
    required this.version,
    this.updatedAt,
    required this.packs,
  });

  factory SyncManifestDto.fromJson(Map<String, dynamic> json) {
    final rawPacks = json['packs'] as List<dynamic>? ?? [];
    return SyncManifestDto(
      version: json['version'] as int,
      updatedAt: json['updatedAt'] as String?,
      packs: rawPacks
          .map((p) => QuestionPackMetadataDto.fromJson(p as Map<String, dynamic>))
          .toList(),
    );
  }

  SyncManifest toDomain() {
    return SyncManifest(
      version: version,
      updatedAt: updatedAt,
      packs: packs.map((p) => p.toDomain()).toList(),
    );
  }
}

class QuestionPackMetadataDto {
  final String id;
  final String subject;
  final String ageGroup;
  final int version;
  final int questionCount;
  final String url;
  final String? sha256;
  final String? releaseDate;

  const QuestionPackMetadataDto({
    required this.id,
    required this.subject,
    required this.ageGroup,
    required this.version,
    required this.questionCount,
    required this.url,
    this.sha256,
    this.releaseDate,
  });

  factory QuestionPackMetadataDto.fromJson(Map<String, dynamic> json) {
    return QuestionPackMetadataDto(
      id: json['id'] as String,
      subject: json['subject'] as String,
      ageGroup: (json['ageGroup'] as String?) ?? 'all',
      version: json['version'] as int,
      questionCount: json['questionCount'] as int,
      url: json['url'] as String,
      sha256: json['sha256'] as String?,
      releaseDate: json['releaseDate'] as String?,
    );
  }

  QuestionPackMetadata toDomain() {
    return QuestionPackMetadata(
      id: id,
      subject: subject,
      ageGroup: ageGroup,
      version: version,
      questionCount: questionCount,
      url: url,
      sha256: sha256,
      releaseDate: releaseDate,
    );
  }
}
