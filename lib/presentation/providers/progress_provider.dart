import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/learning_progress.dart';
import 'core_providers.dart';

final overallProgressProvider =
    FutureProvider.autoDispose<OverallProgressSummary>((ref) async {
  final quizRepo = ref.watch(quizRepositoryProvider);
  return await quizRepo.getOverallProgress();
});

final activeSessionProvider = FutureProvider.autoDispose((ref) async {
  final quizRepo = ref.watch(quizRepositoryProvider);
  return await quizRepo.getActiveSession();
});
