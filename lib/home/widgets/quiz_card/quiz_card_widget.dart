import 'package:flutter/material.dart';
import 'package:quizdev/core/core.dart';
import 'package:quizdev/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int totalAnsweredQuestions;
  final int totalQuestions;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.totalAnsweredQuestions,
    required this.totalQuestions,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(height: 8), // Min Space
            Text(title, style: AppTextStyles.heading15),
            SizedBox(height: 8), // Min Space
            Row(
              children: [
                Text("$totalAnsweredQuestions de $totalQuestions",
                    style: AppTextStyles.body11),
                SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: ProgressIndicatorWidget(
                      value: (totalAnsweredQuestions / totalQuestions)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
