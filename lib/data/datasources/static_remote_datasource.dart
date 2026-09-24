import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/app_constants.dart';
import '../../core/errors/app_exception.dart';
import '../../core/utils/checksum_util.dart';
import '../../core/utils/json_validator.dart';
import '../models/question_dto.dart';
import '../models/sync_manifest_dto.dart';

class StaticRemoteDataSource {
  final http.Client _client;

  StaticRemoteDataSource([http.Client? client]) : _client = client ?? http.Client();

  /// Fetches and validates the remote manifest.
  Future<SyncManifestDto> fetchRemoteManifest(String baseUrl) async {
    final cleanUrl = baseUrl.endsWith('/')
        ? '$baseUrl${AppConstants.manifestFileName}'
        : '$baseUrl/${AppConstants.manifestFileName}';

    final uri = Uri.parse(cleanUrl);
    final response = await _client.get(uri).timeout(
      const Duration(seconds: 15),
      onTimeout: () => throw const NetworkException('Manifest fetch timed out'),
    );

    if (response.statusCode != 200) {
      throw NetworkException(
          'Failed to fetch manifest (HTTP ${response.statusCode})');
    }

    final dynamic decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw const ValidationException('Remote manifest is not a valid JSON map');
    }

    JsonValidator.validateManifest(decoded);
    return SyncManifestDto.fromJson(decoded);
  }

  /// Downloads and verifies a question pack from a static URL.
  Future<List<QuestionDto>> downloadAndValidatePack({
    required String packUrl,
    String? expectedSha256,
  }) async {
    final uri = Uri.parse(packUrl);
    final response = await _client.get(uri).timeout(
      const Duration(seconds: 30),
      onTimeout: () => throw const NetworkException('Pack download timed out'),
    );

    if (response.statusCode != 200) {
      throw NetworkException(
          'Failed to download pack (HTTP ${response.statusCode})');
    }

    final rawContent = response.body;

    // Checksum verification
    if (expectedSha256 != null && expectedSha256.isNotEmpty) {
      final isValidChecksum =
          ChecksumUtil.verifySha256(rawContent, expectedSha256);
      if (!isValidChecksum) {
        throw const ValidationException(
            'Checksum mismatch! Downloaded content may be corrupted.');
      }
    }

    final dynamic decoded = jsonDecode(rawContent);
    if (decoded is! Map<String, dynamic>) {
      throw const ValidationException('Downloaded pack is not a valid JSON map');
    }

    JsonValidator.validateQuestionPack(decoded);

    final rawQuestions = decoded['questions'] as List<dynamic>;
    return rawQuestions
        .map((q) => QuestionDto.fromJson(q as Map<String, dynamic>))
        .toList();
  }
}
