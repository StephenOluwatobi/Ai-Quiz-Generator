import 'package:ai_quiz_generator/core/utils/assets_string.dart';
import 'package:flutter/material.dart';

// Provides the optional image area used with a quiz question.
class QuizImage extends StatelessWidget {
  const QuizImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Image.asset(
        ProductAssets.rectangle,
        height: 130,
        width: 293,
      ),
    );
  }
}
