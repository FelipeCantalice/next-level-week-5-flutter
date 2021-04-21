import 'question_model.dart';

enum Level { FACIL, MEDIO, DIFICIL, PERITO }

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAwnsered;
  final String imagem;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionsAwnsered = 0,
    required this.level,
    required this.imagem,
  });
}
