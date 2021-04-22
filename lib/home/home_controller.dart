import 'package:flutter/material.dart';

import 'package:quizdev/home/home_state.dart';
import 'package:quizdev/home/home_repository.dart';
import 'package:quizdev/shared/models/quiz_model.dart';
import 'package:quizdev/shared/models/user_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getAll() async {
    state = HomeState.loading;
    await Future.wait([getUser(), getQuizzes()]);
    state = HomeState.success;
  }

  Future getUser() async {
    user = await repository.getUser();
  }

  Future getQuizzes() async {
    quizzes = await repository.getQuizzes();
  }
}
