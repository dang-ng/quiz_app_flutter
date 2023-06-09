import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/question_highlight.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((e) {
              return Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionHighlight(e['user_answer'] == e['correct_answer'],
                        ((e['question_index'] as int) + 1).toString()),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['question'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            e['user_answer'] as String,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            e['correct_answer'] as String,
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
