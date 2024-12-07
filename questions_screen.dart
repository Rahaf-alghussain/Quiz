import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}
class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex ++;
    });
  }
  @override
  Widget build(context) {
    final currentQuestion = questions [currentQuestionIndex];

    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color:const Color.fromARGB(255, 200, 152, 232),
                fontSize: 24,
                fontWeight:FontWeight.bold,
            ),
                textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.ShuffledAnswers.map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
              );
            })
          ],
          ),
        ),
      ),
    );
  }

}