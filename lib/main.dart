// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// import './question.dart';
// import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Brown', 'score': 10},
        {'text': 'White', 'score': 1},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Tiger', 'score': 8},
        {'text': 'Dog', 'score': 2},
        {'text': 'Gorilla', 'score': 10},
        {'text': 'Snake', 'score': 1},
      ]
    },
    {
      'questionText': 'What is your favorite martial arts',
      'answers': [
        {'text': 'Jui Jitsu', 'score': 2},
        {'text': 'Kali', 'score': 11},
        {'text': 'Muay Thai', 'score': 4},
        {'text': 'Boxing', 'score': 3},
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions');
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
          title: const Text('Mister M Codes Mobile'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
