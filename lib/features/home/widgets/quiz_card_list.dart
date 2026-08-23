import 'package:ai_quiz_generator/core/utils/assets_string.dart';
import 'package:ai_quiz_generator/features/home/widgets/quiz_card.dart';
import 'package:flutter/material.dart';

class QuizCardList extends StatelessWidget {
  const QuizCardList({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            const SizedBox(width: 10),
            QuizCard(
              title: "World Capital",
              score: 90,
              image: ProductAssets.brain,
            ),
            const SizedBox(width: 20),
            QuizCard(
              title: "Marvel Movies",
              score: 90,
              image: ProductAssets.movie,
            ),
            const SizedBox(width: 10),

            QuizCard(
              title: "Disney Movies",
              score: 90,
              image: ProductAssets.star,
            ),
            const SizedBox(width: 10),
            QuizCard(
              title: "Music",
              score: 10,
              image: ProductAssets.scienceImage,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
