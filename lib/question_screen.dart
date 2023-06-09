import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.chooseAnswer, {super.key});

  final void Function(String answer) chooseAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var number = 0;

  void nextPage(String answer) {
    widget.chooseAnswer(answer);

    setState(() {
      number;
    });
    number++;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[number];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffleAnswers().map((e) {
              return AnswerButton(e, nextPage);
            }),
          ],
        ),
      ),
    );
  }
}
