import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.content, this.onTap, {super.key});

  final String content;
  final void Function(String answer) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: () {
          onTap(content);
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: Colors.deepPurple[900],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            )),
        child: Text(
          content,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
