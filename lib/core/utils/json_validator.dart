import '../constants/app_constants.dart';
import '../errors/app_exception.dart';

class JsonValidator {
  JsonValidator._();

  static const List<String> validAgeGroups = [
    AppConstants.ageGroup5to7,
    AppConstants.ageGroup8to10,
    AppConstants.ageGroup11to13,
    'all',
  ];

  /// Validates a single question JSON structure.
  /// Throws [ValidationException] if malformed.
  static void validateQuestion(Map<String, dynamic> json) {
    if (json['id'] == null || json['id'].toString().trim().isEmpty) {
      throw const ValidationException('Question id is missing or empty');
    }
    if (json['subjectId'] == null ||
        SubjectConfig.findById(json['subjectId'].toString()) == null) {
      throw ValidationException(
          'Invalid or unknown subjectId: ${json['subjectId']}');
    }
    if (json['questionText'] == null ||
        json['questionText'].toString().trim().isEmpty) {
      throw ValidationException(
          'Question text is empty for question id: ${json['id']}');
    }
    final options = json['options'];
    if (options is! List || options.length != 4) {
      throw ValidationException(
          'Question must have exactly 4 options. Found: ${options is List ? options.length : 'none'} for id: ${json['id']}');
    }
    for (final opt in options) {
      if (opt == null || opt.toString().trim().isEmpty) {
        throw ValidationException(
            'Option cannot be blank in question id: ${json['id']}');
      }
    }
    final correctOption = json['correctOption'];
    if (correctOption is! int || correctOption < 0 || correctOption > 3) {
      throw ValidationException(
          'correctOption must be an integer index between 0 and 3. Found: $correctOption in id: ${json['id']}');
    }
    if (json['explanation'] == null ||
        json['explanation'].toString().trim().isEmpty) {
      throw ValidationException(
          'Explanation cannot be empty for question id: ${json['id']}');
    }
    if (json['ageGroup'] != null &&
        !validAgeGroups.contains(json['ageGroup'].toString())) {
      throw ValidationException(
          'Invalid ageGroup: ${json['ageGroup']} for question id: ${json['id']}');
    }
  }

  /// Validates a question pack structure.
  static void validateQuestionPack(Map<String, dynamic> json) {
    if (json['packId'] == null || json['packId'].toString().trim().isEmpty) {
      throw const ValidationException('Question pack is missing packId');
    }
    if (json['subjectId'] == null ||
        SubjectConfig.findById(json['subjectId'].toString()) == null) {
      throw ValidationException('Invalid pack subjectId: ${json['subjectId']}');
    }
    if (json['version'] == null || json['version'] is! int) {
      throw const ValidationException('Pack version must be an integer');
    }
    final questions = json['questions'];
    if (questions is! List || questions.isEmpty) {
      throw const ValidationException('Question pack has no questions');
    }

    final seenIds = <String>{};
    for (int i = 0; i < questions.length; i++) {
      final q = questions[i];
      if (q is! Map<String, dynamic>) {
        throw ValidationException('Question at index $i is not a valid JSON map');
      }
      validateQuestion(q);
      final id = q['id'].toString();
      if (seenIds.contains(id)) {
        throw ValidationException('Duplicate question id found in pack: $id');
      }
      seenIds.add(id);
    }
  }

  /// Validates the remote or local manifest structure.
  static void validateManifest(Map<String, dynamic> json) {
    if (json['version'] == null || json['version'] is! int) {
      throw const ValidationException('Manifest version must be an integer');
    }
    final packs = json['packs'];
    if (packs is! List) {
      throw const ValidationException('Manifest packs must be a list');
    }
    for (final pack in packs) {
      if (pack is! Map<String, dynamic>) {
        throw const ValidationException('Pack entry in manifest is not a JSON object');
      }
      if (pack['id'] == null || pack['id'].toString().isEmpty) {
        throw const ValidationException('Pack id is missing in manifest');
      }
      if (pack['subject'] == null) {
        throw const ValidationException('Pack subject is missing in manifest');
      }
      if (pack['version'] == null || pack['version'] is! int) {
        throw const ValidationException('Pack version must be an integer in manifest');
      }
    }
  }
}
