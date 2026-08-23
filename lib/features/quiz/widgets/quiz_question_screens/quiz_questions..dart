import 'package:flutter/material.dart';

class QuizQuestions extends StatelessWidget {
  const QuizQuestions({
    super.key,

    // Tell the widget to expect a string of text
    required this.questionText,
  });
  // Store the string
  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        questionText,
        style: TextStyle(
          fontFamily: 'Fredoka',
          fontWeight: FontWeight.w600,
          fontSize: 24.0,
          color: Color(0xff201343),
        ),
      ),
    );
  }
}
