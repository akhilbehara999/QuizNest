import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../common/app_button.dart';
import '../common/responsive_container.dart';
import '../providers/quiz_provider.dart';
import '../result/result_screen.dart';
import 'widgets/answer_option_button.dart';
import 'widgets/feedback_banner.dart';
import 'widgets/question_card.dart';
import 'widgets/quiz_header.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  Future<bool> _showExitDialog(BuildContext context) async {
    final shouldLeave = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Leave Quiz?'),
        content: const Text(
          'Your progress so far will be saved, but this session will end.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Stay'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
              minimumSize: const Size(80, 40),
            ),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Leave'),
          ),
        ],
      ),
    );
    return shouldLeave ?? false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizProvider);

    // Auto-navigate to result when completed
    if (quizState.isCompleted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const ResultScreen()),
        );
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (quizState.isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text(
                'Preparing your questions...',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (quizState.errorMessage != null || quizState.currentQuestion == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ResponsiveContainer(
          maxWidth: 500,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.info_outline, size: 48, color: AppColors.textMuted),
              const SizedBox(height: 16),
              Text(
                quizState.errorMessage ?? 'No questions available.',
                style: AppTypography.headingMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              AppButton(
                label: 'Go Back',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      );
    }

    final question = quizState.currentQuestion!;
    final isLast = quizState.currentIndex + 1 == quizState.totalQuestions;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final shouldLeave = await _showExitDialog(context);
        if (shouldLeave && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: ResponsiveContainer(
            maxWidth: 600,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Column(
              children: [
                QuizHeader(
                  subjectId: quizState.subjectId,
                  currentIndex: quizState.currentIndex,
                  totalQuestions: quizState.totalQuestions,
                  onExit: () async {
                    final shouldLeave = await _showExitDialog(context);
                    if (shouldLeave && context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        QuestionCard(
                          questionText: question.questionText,
                          category: question.category,
                          difficulty: question.difficulty,
                        ),
                        const SizedBox(height: 18),
                        ...List.generate(question.options.length, (index) {
                          final isSelected =
                              quizState.selectedOptionIndex == index;
                          final isCorrectOption =
                              question.correctOptionIndex == index;

                          return AnswerOptionButton(
                            optionIndex: index,
                            optionText: question.options[index],
                            isSelected: isSelected,
                            isSubmitted: quizState.isAnswerSubmitted,
                            isCorrectOption: isCorrectOption,
                            onTap: () {
                              ref
                                  .read(quizProvider.notifier)
                                  .selectOption(index);
                            },
                          );
                        }),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (quizState.isAnswerSubmitted) ...[
                  FeedbackBanner(
                    isCorrect: quizState.isAnswerCorrect,
                    explanation: question.explanation,
                    correctAnswerText: question.correctAnswerText,
                    isLastQuestion: isLast,
                    onNext: () {
                      ref.read(quizProvider.notifier).nextQuestion();
                    },
                  ),
                ] else ...[
                  AppButton(
                    label: 'Submit Answer',
                    icon: Icons.check_circle_outline_rounded,
                    onPressed: quizState.selectedOptionIndex != null
                        ? () {
                            ref
                                .read(quizProvider.notifier)
                                .submitAnswer();
                          }
                        : null,
                  ),
                ],
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
