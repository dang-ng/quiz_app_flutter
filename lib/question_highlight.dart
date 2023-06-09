import 'package:flutter/material.dart';

class QuestionHighlight extends StatelessWidget {
  const QuestionHighlight(this.isCorrect, this.questionIndex, {super.key});

  final bool isCorrect;
  final String questionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: isCorrect ? Colors.cyan : Colors.pink.shade300,
        borderRadius: BorderRadius.circular(100),
      ),
      width: 30,
      height: 30,
      alignment: Alignment.center,
      child: Text(
        questionIndex,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
