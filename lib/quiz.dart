import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

class Quiz extends StatelessWidget {
  const Quiz({
    required this.questions,
    required this.answerQustion,
    required this.questionIndex,
    super.key,
  });

  final List<Map<String, Object>> questions;
  final Function(int) answerQustion;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            selectHandler: () => answerQustion(answer['score'] as int),
            answerText: answer['text'].toString(),
          );
        }).toList(),
      ],
    );
  }
}
