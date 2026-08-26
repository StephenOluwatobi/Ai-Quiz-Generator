import 'package:ai_quiz_generator/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final int percentage;

  const ScoreCard({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepPurple.withValues(alpha: 0.10),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Your score',
            style: TextStyle(
              fontFamily: 'Fredoka',
              fontSize: 13,
              color: AppColors.subtitlePurple,
            ),
          ),

          const SizedBox(height: 6),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$correctAnswers/$totalQuestions',
                style: const TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.deepPurple,
                ),
              ),

              Container(
                width: 2,
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: AppColors.orange.withValues(alpha: 0.30),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              Column(
                children: [
                  Text(
                    '$percentage%',
                    style: const TextStyle(
                      fontFamily: 'Fredoka',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.orange,
                    ),
                  ),
                  const Text(
                    'correct',
                    style: TextStyle(
                      fontFamily: 'Fredoka',
                      fontSize: 10,
                      color: AppColors.subtitlePurple,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}