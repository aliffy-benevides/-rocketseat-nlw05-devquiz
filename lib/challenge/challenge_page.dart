import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizdev/challenge/challenge_controller.dart';
import 'package:quizdev/challenge/widgets/next_button/next_button_widget.dart';
import 'package:quizdev/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:quizdev/challenge/widgets/quiz/quiz_widget.dart';
import 'package:quizdev/home/home_page.dart';
import 'package:quizdev/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({Key? key, required this.questions}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt();
    });

    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    } else {
      Navigator.pop(context);
    }
  }

  void confirmAnswer() {
    controller.isQuestionAnswered = false;
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BackButton(),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ValueListenableBuilder<bool>(
                valueListenable: controller.isQuestionAnsweredNotifier,
                builder: (context, isAnswered, _) {
                  return ValueListenableBuilder<int>(
                    valueListenable: controller.currentPageNotifier,
                    builder: (context, currentPage, _) {
                      return QuestionIndicatorWidget(
                        questionsAnswered:
                            isAnswered ? (currentPage + 1) : currentPage,
                        length: widget.questions.length,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onAnswered: () {
                    controller.isQuestionAnswered = true;
                  },
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ValueListenableBuilder<bool>(
            valueListenable: controller.isQuestionAnsweredNotifier,
            builder: (context, isAnswered, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: isAnswered
                      ? NextButtonWidget.disabled("Pular", () {})
                      : NextButtonWidget.white("Pular", nextPage),
                ),
                SizedBox(width: 7),
                Expanded(
                  child: isAnswered
                      ? NextButtonWidget.green("Confirmar", confirmAnswer)
                      : NextButtonWidget.disabled("Confirmar", () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
