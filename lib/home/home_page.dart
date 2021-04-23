import 'package:flutter/material.dart';
import 'package:quizdev/challenge/challenge_page.dart';
import 'package:quizdev/core/core.dart';

import 'home_controller.dart';
import 'package:quizdev/home/home_state.dart';
import 'package:quizdev/home/widgets/app_bar/app_bar_widget.dart';
import 'package:quizdev/home/widgets/level_button/level_button_widget.dart';
import 'package:quizdev/home/widgets/quiz_card/quiz_card_widget.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getAll();

    controller.stateNotifier.addListener(() {
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state != HomeState.success) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBarWidget(controller.user!),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(label: "Fácil"),
                LevelButtonWidget(label: "Médio"),
                LevelButtonWidget(label: "Difícil"),
                LevelButtonWidget(label: "Perito"),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: controller.quizzes!
                    .map((e) => QuizCardWidget(
                          title: e.title,
                          totalAnsweredQuestions: e.questionAnswered,
                          totalQuestions: e.questions.length,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChallengePage(questions: e.questions)));
                          },
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
