import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/data/questions.dart';
import 'package:quiz_app_flutter/question_screen.dart';
import 'package:quiz_app_flutter/result_screen.dart';
import 'package:quiz_app_flutter/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(selectedAnswers, restartQuiz);
        selectedAnswers = [];
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = StartScreen(switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purple,
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
