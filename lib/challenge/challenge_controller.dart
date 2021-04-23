import 'package:flutter/material.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(0);
  final isQuestionAnsweredNotifier = ValueNotifier<bool>(false);

  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;

  bool get isQuestionAnswered => isQuestionAnsweredNotifier.value;
  set isQuestionAnswered(bool value) => isQuestionAnsweredNotifier.value = value;
}
