import 'dart:math' as math;
import 'package:ai_quiz_generator/core/constants/app_colors.dart';
import 'package:ai_quiz_generator/core/utils/assets_string.dart';
import 'package:ai_quiz_generator/features/quiz/widgets/quiz_result_screen/result_card.dart';
import 'package:ai_quiz_generator/features/quiz/widgets/quiz_result_screen/result_screen_close_button.dart';
import 'package:flutter/material.dart';

// Shows the score and reward details after a quiz is completed.
class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({
    super.key,
    this.userName = 'Tobi',
    this.score = 840,
    this.isNewBest = true,
    this.starsEarned = 120,
  });

  // Supplies the details displayed on the result card.
  final String userName;
  final int score;
  final bool isNewBest;
  final int starsEarned;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              // Close Button
              QuizResultCloseButtonIcon(),

              // Title
              const Text(
                'Quiz completed!',
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontWeight: FontWeight.w600,
                  fontSize: 32.0,
                  color: Color(0xff2D1654),
                ),
              ),

              const SizedBox(height: 10),

              // Subtitle
              RichText(
                text: TextSpan(
                  text: 'Great job',
                  style: const TextStyle(
                    color: AppColors.subtitlePurple,
                    fontFamily: "Inter",
                    fontSize: 16.0,
                  ),
                  children: [
                    TextSpan(
                      text: " $userName! 🎉",
                      style: const TextStyle(
                        color: AppColors.orange,
                        fontFamily: "Inter",
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Robot and container stack
              // Layers the celebration artwork around the result card.
              Stack(
                clipBehavior: Clip.none,
                // alignment: Alignment.topCenter,
                children: [
                  
                  // Robot image
                  Positioned(
                    top: 0,
                    left: -40,
                    child: Image.asset(
                      ProductAssets.robotWithTrophy,
                      width: 336,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Top right glitter
                  Positioned(
                    top: 35,
                    right: -90,
                    // Grows the glitter into view for a small celebration effect.
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeOutBack,
                      builder: (context, scale, child) {
                        return Transform.scale(
                          scale: scale,
                          child: Transform.rotate(
                            angle: -88.85 * math.pi / 180,
                            child: Image.asset(
                              ProductAssets.glitters,
                              width: 165.12,
                              height: 149.93,
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // ---------- Result card ----------
                  ResultCard(
                    isNewBest: isNewBest,
                    score: score,
                    starsEarned: starsEarned,
                  ),

                  // Bottim left glitter
                  Positioned(
                    top: 570,
                    right: 220,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeOutBack,
                      builder: (context, scale, child) {
                        return Transform.scale(
                          scale: scale,
                          child: Transform.rotate(
                            angle: -20.86 * math.pi / 180,
                            child: Image.asset(
                              ProductAssets.glitters,
                              width: 165.12,
                              height: 149.93,
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
