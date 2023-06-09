import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers, this.restartQuiz, {super.key});

  final void Function() restartQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int totalAnswers = chosenAnswers.length;
    int correctAnswers = summaryData
        .where((e) => e['user_answer'] == e['correct_answer'])
        .length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $totalAnswers questions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'List of answers and questions:',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 50,
            ),
            OutlinedButton.icon(
                onPressed: restartQuiz,
                icon: const Icon(Icons.restart_alt),
                label: const Text(
                  'Restart Quiz!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
