import 'dart:convert';
import 'package:flutter/services.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/json_validator.dart';
import '../models/question_dto.dart';
import '../models/sync_manifest_dto.dart';

class LocalAssetDataSource {
  static const String assetBasePath = 'assets/question_packs';

  /// Loads and validates the local manifest bundled in assets.
  Future<SyncManifestDto> loadBundledManifest() async {
    final rawString =
        await rootBundle.loadString('$assetBasePath/${AppConstants.manifestFileName}');
    final dynamic decoded = jsonDecode(rawString);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Manifest is not a valid JSON map');
    }
    JsonValidator.validateManifest(decoded);
    return SyncManifestDto.fromJson(decoded);
  }

  /// Loads and validates a subject question pack bundled in assets.
  Future<List<QuestionDto>> loadBundledPack(String subjectId) async {
    final filePath = '$assetBasePath/$subjectId.json';
    final rawString = await rootBundle.loadString(filePath);
    final dynamic decoded = jsonDecode(rawString);
    if (decoded is! Map<String, dynamic>) {
      throw FormatException('Pack for $subjectId is not a valid JSON map');
    }

    JsonValidator.validateQuestionPack(decoded);

    final rawQuestions = decoded['questions'] as List<dynamic>;
    return rawQuestions
        .map((q) => QuestionDto.fromJson(q as Map<String, dynamic>))
        .toList();
  }
}
