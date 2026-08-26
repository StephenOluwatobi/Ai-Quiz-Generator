import 'package:ai_quiz_generator/app/navigation/main_navigation.dart';
import 'package:flutter/material.dart';

// Provides a compact close button that returns from results to the home area.
class QuizResultCloseButtonIcon extends StatelessWidget {
  const QuizResultCloseButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Container(
          height: 32.0,
          width: 32.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: const Color(0xffFEF8EF),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            // Opens the main navigation when the user closes the result screen.
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainNavigation(),
                ),
              );
            },
            icon: const Icon(
              Icons.close,
              color: Color(0xff201343),
              size: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
