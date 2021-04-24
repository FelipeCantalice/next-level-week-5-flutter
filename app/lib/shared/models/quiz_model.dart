import 'dart:convert';

import 'question_model.dart';

enum Level { FACIL, MEDIO, DIFICIL, PERITO }

extension LevelStringExt on String {
  Level get parse => {
        "FACIL": Level.FACIL,
        "MEDIO": Level.MEDIO,
        "DIFICIL": Level.DIFICIL,
        "PERITO": Level.PERITO
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.FACIL: "FACIL",
        Level.MEDIO: "MEDIO",
        Level.DIFICIL: "DIFICIL",
        Level.PERITO: "PERITO"
      }[this]!;
}

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

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionsAwnsered': questionsAwnsered,
      'imagem': imagem,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionsAwnsered: map['questionsAwnsered'],
      imagem: map['imagem'],
      level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
