import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget{
  const StartScreen( this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context){
    return Center(
        child:  Column(
          mainAxisSize: MainAxisSize.min ,
          children: [
            Image.asset(
                'assests/quizlogo.png',
                 width: 300,
                 color: const Color.fromARGB(150, 255, 255, 255),
            ),
            const SizedBox(height: 80),
            Text(
              'Learn Flutter The Fun Way !',
              style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 237, 223, 252),
                    fontSize: 24,
                  ),
              ),

            const SizedBox(height: 30),
            OutlinedButton.icon(
                onPressed: () {
                  startQuiz();
                },
                style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(70, 80, 86, 100),
                ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz'),
            ),
          ],
      ),
    );
  }
}