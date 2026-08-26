import 'package:ai_quiz_generator/core/constants/app_colors.dart';
import 'package:ai_quiz_generator/core/utils/assets_string.dart';
import 'package:ai_quiz_generator/features/quiz/widgets/quiz_time_up_screen/score_card.dart';
import 'package:flutter/material.dart';

class QuizTimeUpScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  const QuizTimeUpScreen({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
  });

  int get percentage {
    if (totalQuestions == 0) {
      return 0;
    }

    return ((correctAnswers / totalQuestions) * 100).round();
  }

  void returnToHome(BuildContext context) {
    // This returns to the first screen in the navigation stack.
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 28,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Add your hourglass image asset here.
                    Image.asset(ProductAssets.timeExpired),
                    const SizedBox(height: 16),

                    const Text(
                      'Time’s Up!',
                      style: TextStyle(
                        fontFamily: 'Fredoka',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepPurple,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'You ran out of time on this question.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Fredoka',
                        fontSize: 14,
                        color: AppColors.subtitlePurple,
                      ),
                    ),

                    const SizedBox(height: 24),

                    ScoreCard(
                      correctAnswers: correctAnswers,
                      totalQuestions: totalQuestions,
                      percentage: percentage,
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => returnToHome(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.deepPurple,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh_rounded, size: 24),
                      SizedBox(width: 10),
                      Text(
                        'Try Again',
                        style: TextStyle(
                          fontFamily: 'Fredoka',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Restart this question from the beginning',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 12,
                  color: AppColors.subtitlePurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
