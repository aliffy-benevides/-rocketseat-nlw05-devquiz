import 'package:flutter/material.dart';
import 'package:quizdev/challenge/widgets/answer/answer_widget.dart';
import 'package:quizdev/core/core.dart';
import 'package:quizdev/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onAnswered;

  const QuizWidget({Key? key, required this.question, required this.onAnswered}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? indexSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 54),
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          Expanded(
            child: ListView(
              children: widget.question.answers
                  .map((answer) {
                    int i = widget.question.answers.indexOf(answer);
                    return AnswerWidget(
                        isSelected: indexSelected == i,
                        answer: answer,
                        disabled: indexSelected != null,
                        onTap: () {
                          indexSelected = i;
                          widget.onAnswered(answer.isRight);
                          setState(() {});
                        },
                      );
                  })
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
