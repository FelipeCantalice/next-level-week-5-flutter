import 'package:flutter/material.dart';
import 'package:nlw_5/core/core.dart';
import 'package:nlw_5/shared/models/awnser_model.dart';
import 'package:nlw_5/shared/models/question_model.dart';
import 'package:nlw_5/shared/models/quiz_model.dart';
import 'package:nlw_5/shared/models/user_model.dart';
import 'home_state.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.EMPTY);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.LOADING;
    await Future.delayed(Duration(seconds: 2));
    user = UserModel(
      name: "Felipe",
      photoURL: "https://avatars.githubusercontent.com/u/81821387?v=4",
    );
    state = HomeState.SUCCESS;
  }

  void getQuizzes() async {
    state = HomeState.LOADING;
    await Future.delayed(Duration(seconds: 2));
    quizzes = [
      QuizModel(
        title: "NLW 5 Flutter",
        imagem: AppImages.blocks,
        level: Level.FACIL,
        questionsAwnsered: 1,
        questions: [
          QuestionModel(
            title: "fef",
            awnsers: [
              AwnserModel(title: "efef"),
              AwnserModel(title: "efef"),
              AwnserModel(title: "efef"),
              AwnserModel(
                title: "efef",
                isRight: true,
              ),
            ],
          ),
          QuestionModel(
            title: "fef",
            awnsers: [
              AwnserModel(title: "efef"),
              AwnserModel(title: "efef"),
              AwnserModel(title: "efef"),
              AwnserModel(
                title: "efef",
                isRight: true,
              ),
            ],
          ),
        ],
      ),
    ];
    state = HomeState.SUCCESS;
  }
}
