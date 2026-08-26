import 'package:flutter/material.dart';

// Displays one answer choice and lets the parent handle the user's tap.
class AnswerOptions extends StatelessWidget {
  const AnswerOptions({
    super.key,
    required this.option,
    required this.question,
    required this.backgroundColor,
    required this.answerTaped,
  });
  // Holds the label, answer text, colour, and tap action for this choice.
  final String option;
  final String question;
  final Color backgroundColor;
  final VoidCallback answerTaped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Sends the chosen answer back to the question card.
      onTap: answerTaped,
      child: Container(
        width: 321,
        height: 68,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withValues(alpha: 0.16),
              offset: const Offset(1, 1),
              blurRadius: 10.8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                17.0,
                10.0,
                16.0,
                11.0,
              ),
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xffEDE3FD),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    17.0,
                    10.0,
                    16.0,
                    11.0,
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      fontFamily: 'Fredoka',
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      height: 1.1,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Text(
                question,
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  height: 1.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
