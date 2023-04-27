import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() => runApp(const MyCoolApp());

class MyCoolApp extends StatefulWidget {
  const MyCoolApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyCoolApp> {
  final List<Map<String, Object>> _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 1},
        {'text': 'Green', 'score': 3},
        {'test': 'White', 'score': 6},
      ],
    },
    {
      'questionText': 'What\'s your fovorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 1},
        {'text': 'Lion', 'score': 3},
        {'test': 'Elephant', 'score': 6},
      ],
    },
    {
      'questionText': 'What\'s your fovorite instructor?',
      'answers': [
        {'text': 'Test', 'score': 10},
        {'text': 'Snake', 'score': 1},
        {'text': 'Lion', 'score': 3},
        {'test': 'Elephant', 'score': 6},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQustion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQustion: _answerQustion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
