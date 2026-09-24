class SyncResult {
  final bool success;
  final int packsUpdated;
  final int questionsAddedOrUpdated;
  final String? errorMessage;

  const SyncResult({
    required this.success,
    this.packsUpdated = 0,
    this.questionsAddedOrUpdated = 0,
    this.errorMessage,
  });

  factory SyncResult.success({int packsUpdated = 0, int questionsUpdated = 0}) {
    return SyncResult(
      success: true,
      packsUpdated: packsUpdated,
      questionsAddedOrUpdated: questionsUpdated,
    );
  }

  factory SyncResult.failure(String error) {
    return SyncResult(
      success: false,
      errorMessage: error,
    );
  }
}

abstract class SyncRepository {
  Future<SyncResult> syncWithRemote({String? customBaseUrl});

  Future<int> getLocalManifestVersion();

  Future<void> seedInitialQuestionsIfEmpty();

  Future<DateTime?> getLastSyncTime();

  /// Replenishes solved questions by fetching fresh questions from OpenTDB
  /// and replacing purged solved questions in the database.
  Future<SyncResult> replenishSolvedQuestions({String? subjectId, String? ageGroup});
}

