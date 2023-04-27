import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(this.totalScore, this.resetHandler, {super.key});

  final int totalScore;
  final VoidCallback resetHandler;

  String get resultPhrase {
    String resultText;
    if (totalScore <= 8) {
      resultText = 'You are awrsome and innocent!';
    } else if (totalScore <= 15) {
      resultText = 'Oh...';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: resetHandler,
          child: const Text(
            'Reset',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
