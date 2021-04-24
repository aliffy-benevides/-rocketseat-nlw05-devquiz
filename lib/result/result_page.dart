import 'package:flutter/material.dart';
import 'package:quizdev/challenge/widgets/next_button/next_button_widget.dart';
import 'package:quizdev/core/core.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 68),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.trophy),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Parabéns!", style: AppTextStyles.heading40),
                  SizedBox(height: 16),
                  Text("Você concluiu", style: AppTextStyles.body),
                  Text(title, style: AppTextStyles.bodyBold),
                  Text("com $result de $length acertos", style: AppTextStyles.body),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NextButtonWidget.purple("Compartilhar", () {
                    Share.share("DevQuiz NLW 5 - Flutter: Resultado do Quiz: $title\nObtive: ${100 * result / length}% de aproveitamento!");
                  }),
                  SizedBox(height: 16),
                  NextButtonWidget.white("Voltar ao início", () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
