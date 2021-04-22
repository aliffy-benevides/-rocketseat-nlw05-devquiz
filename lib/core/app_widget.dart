import 'package:flutter/material.dart';

import 'package:quizdev/home/home_page.dart';
// import 'package:quizdev/challenge/challenge_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: HomePage(),
    );
  }
}
