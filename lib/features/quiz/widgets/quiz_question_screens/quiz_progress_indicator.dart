import 'package:flutter/material.dart';

// Shows which questions in the quiz have been reached so far.
class QuizProgressIndicator extends StatelessWidget {
  const QuizProgressIndicator({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
  });

  // Uses the current position and total to draw the correct number of bars.
  final int currentIndex;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: List.generate(totalQuestions, (index) {
          // this enures the current and all past dashes light up
          bool isActive = index <= currentIndex;

          return Expanded(
            child: Container(
              height: 6,
              margin: EdgeInsets.symmetric(
                horizontal: index == 0 ? 0 : 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: isActive
                    ? const Color(0xffFEA18D)
                    : const Color(0xffEAE7E9),
              ),
            ),
          );
        }),
      ),
    );
  }
}
