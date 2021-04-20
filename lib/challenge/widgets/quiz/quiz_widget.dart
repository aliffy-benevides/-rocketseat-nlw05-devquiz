import 'package:flutter/material.dart';
import 'package:quizdev/challenge/widgets/answer/answer_widget.dart';
import 'package:quizdev/core/core.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          Column(
            children: [
              AnswerWidget(
                isSelected: false,
                isRight: false,
                title:
                    "Possibilidade a criação de APPs nativos para qualquer plataforma",
              ),
              SizedBox(height: 8),
              AnswerWidget(
                isSelected: true,
                isRight: false,
                title:
                    "Possibilidade a criação de APPs nativos para qualquer plataforma",
              ),
              SizedBox(height: 8),
              AnswerWidget(
                isSelected: true,
                isRight: true,
                title:
                    "Possibilidade a criação de APPs nativos para qualquer plataforma",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
