import 'package:flutter/material.dart';
import 'package:quizdev/core/core.dart';
import 'package:quizdev/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text("Gerenciamento de Estado", style: AppTextStyles.heading15),
          SizedBox(height: 8), // Min Space
          Row(
            children: [
              Text("3 de 10", style: AppTextStyles.body11),
              SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: ProgressIndicatorWidget(value: 0.3),
              ),
            ],
          )
        ],
      ),
    );
  }
}
