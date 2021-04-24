import 'package:flutter/material.dart';
import 'package:nlw_5/home/home_repository.dart';
import 'package:nlw_5/shared/models/quiz_model.dart';
import 'package:nlw_5/shared/models/user_model.dart';
import 'home_state.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.EMPTY);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;
  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.LOADING;
    user = await repository.getUser();
  }

  void getQuizzes() async {
    await Future.delayed(Duration(seconds: 2));
    quizzes = await repository.getQuizzes();
    state = HomeState.SUCCESS;
  }
}
