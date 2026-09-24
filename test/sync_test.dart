import 'package:flutter_test/flutter_test.dart';
import 'package:triva/core/errors/app_exception.dart';
import 'package:triva/core/utils/json_validator.dart';
import 'package:triva/data/models/sync_manifest_dto.dart';

void main() {
  group('Sync Manifest & Pack Parsing Tests', () {
    test('Parses valid manifest JSON into domain entities', () {
      final manifestJson = {
        'version': 3,
        'updatedAt': '2026-09-23T00:00:00Z',
        'packs': [
          {
            'id': 'science_pack_001',
            'subject': 'science',
            'ageGroup': 'all',
            'version': 3,
            'questionCount': 100,
            'url': 'https://static.cdn.com/packs/science.json',
            'sha256': 'abc123def456',
            'releaseDate': '2026-09-23',
          },
          {
            'id': 'math_pack_001',
            'subject': 'math',
            'ageGroup': 'all',
            'version': 2,
            'questionCount': 100,
            'url': 'https://static.cdn.com/packs/math.json',
            'sha256': '789xyz123',
            'releaseDate': '2026-09-23',
          },
        ],
      };

      expect(() => JsonValidator.validateManifest(manifestJson), returnsNormally);

      final dto = SyncManifestDto.fromJson(manifestJson);
      final domain = dto.toDomain();

      expect(domain.version, equals(3));
      expect(domain.packs.length, equals(2));
      expect(domain.packs.first.subject, equals('science'));
      expect(domain.packs.first.version, equals(3));
      expect(domain.packs.first.sha256, equals('abc123def456'));
    });

    test('Malformed manifest with missing packs throws ValidationException', () {
      final invalidManifest = {
        'version': 2,
      };

      expect(
        () => JsonValidator.validateManifest(invalidManifest),
        throwsA(isA<ValidationException>()),
      );
    });

    test('Malformed pack with missing subjectId throws ValidationException', () {
      final invalidPack = {
        'packId': 'pack_without_subject',
        'version': 1,
        'questions': [],
      };

      expect(
        () => JsonValidator.validateQuestionPack(invalidPack),
        throwsA(isA<ValidationException>()),
      );
    });
  });
}
