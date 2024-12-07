import 'package:flutter/material.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/results_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz ({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length){
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }
  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen'){
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 124, 8, 236),
                  Color.fromARGB(255, 168, 25, 101),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
          ),
          child: screenWidget,

        ),
      ),
  );
  }
}