import 'package:ai_quiz_generator/features/home/widgets/continue_quiz_section.dart';
import 'package:ai_quiz_generator/features/home/widgets/greeting_section.dart';
import 'package:ai_quiz_generator/features/home/widgets/quiz_card_list.dart';
import 'package:ai_quiz_generator/features/home/widgets/quiz_generator_card.dart';
import 'package:ai_quiz_generator/features/home/widgets/stats_section.dart';
import 'package:ai_quiz_generator/features/home/widgets/topic_card.dart';
import 'package:ai_quiz_generator/features/home/widgets/topic_section.dart';
import 'package:flutter/material.dart';

// Shows the main dashboard where a user can start or continue a quiz.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF8EF),
      // Lets the dashboard fit on smaller screens without cutting off sections.
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            GreetingSection(),

            const SizedBox(height: 10.0),

            QuizGeneratorCard(),

            const SizedBox(height: 10.0),

            TopicSection(),

            const SizedBox(height: 10.0),

            TopicCards(),

            const SizedBox(height: 10.0),

            ContinueQuizSection(),

            const SizedBox(height: 10.0),
            QuizCardList(),
            const SizedBox(height: 10.0),

            StatsCard(),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
