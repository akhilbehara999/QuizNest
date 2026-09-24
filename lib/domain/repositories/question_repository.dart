import '../entities/question.dart';

abstract class QuestionRepository {
  Future<List<Question>> getQuestionsForQuiz({
    required String subjectId,
    required String ageGroup,
    int count = 10,
  });

  Future<int> getQuestionCountForSubject(String subjectId);

  Future<int> getUnsolvedQuestionCountForSubject(String subjectId);

  Future<int> purgeSolvedQuestions(String subjectId);

  Future<void> upsertQuestions(List<Question> questions);

  Future<bool> hasQuestions();
}

