import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/entities/question.dart';
import '../../domain/entities/quiz_answer.dart';
import '../../domain/entities/quiz_session.dart';
import 'core_providers.dart';
import 'progress_provider.dart';

class QuizState {
  final bool isLoading;
  final String subjectId;
  final String ageGroup;
  final List<Question> questions;
  final int currentIndex;
  final int? selectedOptionIndex;
  final bool isAnswerSubmitted;
  final bool isAnswerCorrect;
  final int score;
  final String sessionId;
  final bool isCompleted;
  final String? errorMessage;
  final List<QuizAnswer> userAnswers;

  const QuizState({
    this.isLoading = false,
    this.subjectId = '',
    this.ageGroup = '',
    this.questions = const [],
    this.currentIndex = 0,
    this.selectedOptionIndex,
    this.isAnswerSubmitted = false,
    this.isAnswerCorrect = false,
    this.score = 0,
    this.sessionId = '',
    this.isCompleted = false,
    this.errorMessage,
    this.userAnswers = const [],
  });

  Question? get currentQuestion =>
      questions.isNotEmpty && currentIndex < questions.length
          ? questions[currentIndex]
          : null;

  int get totalQuestions => questions.length;
  double get progress =>
      totalQuestions > 0 ? (currentIndex + 1) / totalQuestions : 0.0;
  double get accuracyPercent =>
      totalQuestions > 0 ? (score / totalQuestions) * 100 : 0.0;

  QuizState copyWith({
    bool? isLoading,
    String? subjectId,
    String? ageGroup,
    List<Question>? questions,
    int? currentIndex,
    int? Function()? selectedOptionIndex,
    bool? isAnswerSubmitted,
    bool? isAnswerCorrect,
    int? score,
    String? sessionId,
    bool? isCompleted,
    String? Function()? errorMessage,
    List<QuizAnswer>? userAnswers,
  }) {
    return QuizState(
      isLoading: isLoading ?? this.isLoading,
      subjectId: subjectId ?? this.subjectId,
      ageGroup: ageGroup ?? this.ageGroup,
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedOptionIndex: selectedOptionIndex != null
          ? selectedOptionIndex()
          : this.selectedOptionIndex,
      isAnswerSubmitted: isAnswerSubmitted ?? this.isAnswerSubmitted,
      isAnswerCorrect: isAnswerCorrect ?? this.isAnswerCorrect,
      score: score ?? this.score,
      sessionId: sessionId ?? this.sessionId,
      isCompleted: isCompleted ?? this.isCompleted,
      errorMessage:
          errorMessage != null ? errorMessage() : this.errorMessage,
      userAnswers: userAnswers ?? this.userAnswers,
    );
  }
}

class QuizNotifier extends Notifier<QuizState> {
  static const _uuid = Uuid();

  @override
  QuizState build() {
    return const QuizState();
  }

  Future<void> startQuiz({
    required String subjectId,
    required String ageGroup,
    int count = AppConstants.defaultQuestionsPerQuiz,
  }) async {
    state = QuizState(
      isLoading: true,
      subjectId: subjectId,
      ageGroup: ageGroup,
      sessionId: _uuid.v4(),
    );

    try {
      final questionRepo = ref.read(questionRepositoryProvider);
      final questions = await questionRepo.getQuestionsForQuiz(
        subjectId: subjectId,
        ageGroup: ageGroup,
        count: count,
      );

      if (questions.isEmpty) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: () =>
              'No questions found for this subject yet. Please select another subject or wait for sync.',
        );
        return;
      }

      // Record active quiz session in DB
      final quizRepo = ref.read(quizRepositoryProvider);
      final session = QuizSession(
        id: state.sessionId,
        subjectId: subjectId,
        ageGroup: ageGroup,
        totalQuestions: questions.length,
        score: 0,
        isCompleted: false,
        startedAt: DateTime.now(),
      );
      await quizRepo.saveQuizSession(session);

      state = state.copyWith(
        isLoading: false,
        questions: questions,
        currentIndex: 0,
        selectedOptionIndex: () => null,
        isAnswerSubmitted: false,
        isAnswerCorrect: false,
        score: 0,
        errorMessage: () => null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: () => 'Failed to initialize quiz: $e',
      );
    }
  }

  void selectOption(int index) {
    if (state.isAnswerSubmitted || state.isCompleted) return;
    state = state.copyWith(selectedOptionIndex: () => index);
  }

  Future<void> submitAnswer() async {
    final currentQ = state.currentQuestion;
    final selected = state.selectedOptionIndex;
    if (currentQ == null || selected == null || state.isAnswerSubmitted) {
      return;
    }

    final isCorrect = currentQ.isCorrect(selected);
    final newScore = isCorrect ? state.score + 1 : state.score;

    final answer = QuizAnswer(
      id: _uuid.v4(),
      sessionId: state.sessionId,
      questionId: currentQ.id,
      selectedOptionIndex: selected,
      isCorrect: isCorrect,
      answeredAt: DateTime.now(),
    );

    final updatedAnswers = List<QuizAnswer>.from(state.userAnswers)..add(answer);

    // Save answer and update subject learning progress in local DB
    final quizRepo = ref.read(quizRepositoryProvider);
    await quizRepo.saveQuizAnswer(answer);
    await quizRepo.updateSubjectProgress(
      subjectId: state.subjectId,
      answeredIncrement: 1,
      correctIncrement: isCorrect ? 1 : 0,
    );

    state = state.copyWith(
      isAnswerSubmitted: true,
      isAnswerCorrect: isCorrect,
      score: newScore,
      userAnswers: updatedAnswers,
    );
  }

  Future<void> nextQuestion() async {
    if (state.currentIndex + 1 < state.questions.length) {
      state = state.copyWith(
        currentIndex: state.currentIndex + 1,
        selectedOptionIndex: () => null,
        isAnswerSubmitted: false,
        isAnswerCorrect: false,
      );
    } else {
      // Complete Quiz Session
      final quizRepo = ref.read(quizRepositoryProvider);
      final completedSession = QuizSession(
        id: state.sessionId,
        subjectId: state.subjectId,
        ageGroup: state.ageGroup,
        totalQuestions: state.questions.length,
        score: state.score,
        isCompleted: true,
        startedAt: DateTime.now(),
        completedAt: DateTime.now(),
      );
      await quizRepo.saveQuizSession(completedSession);

      // Invalidate progress provider so progress screen updates immediately
      ref.invalidate(overallProgressProvider);

      // Auto-replenish solved questions in the background from OpenTDB
      final syncRepo = ref.read(syncRepositoryProvider);
      syncRepo.replenishSolvedQuestions(
        subjectId: state.subjectId,
        ageGroup: state.ageGroup,
      ).ignore();

      state = state.copyWith(isCompleted: true);
    }
  }


  void retryQuiz() {
    startQuiz(
      subjectId: state.subjectId,
      ageGroup: state.ageGroup,
      count: state.questions.isNotEmpty
          ? state.questions.length
          : AppConstants.defaultQuestionsPerQuiz,
    );
  }
}

final quizProvider =
    NotifierProvider<QuizNotifier, QuizState>(QuizNotifier.new);
