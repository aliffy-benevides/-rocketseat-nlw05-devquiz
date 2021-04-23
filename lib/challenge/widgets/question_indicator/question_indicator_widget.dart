import 'package:flutter/material.dart';
import 'package:quizdev/core/core.dart';

import 'package:quizdev/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int questionsAnswered;
  final int length;

  const QuestionIndicatorWidget({Key? key, required this.questionsAnswered, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Questão $questionsAnswered", style: AppTextStyles.body),
            Text("de $length", style: AppTextStyles.body),
          ],
        ),
        SizedBox(height: 16),
        ProgressIndicatorWidget(value: questionsAnswered/length)
      ]),
    );
  }
}
