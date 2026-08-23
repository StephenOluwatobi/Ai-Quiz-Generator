import 'package:ai_quiz_generator/app/navigation/main_navigation.dart';
import 'package:ai_quiz_generator/core/constants/app_colors.dart';
import 'package:ai_quiz_generator/core/utils/assets_string.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.isNewBest,
    required this.score,
    required this.starsEarned,
  });

  final bool isNewBest;
  final int score;
  final int starsEarned;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 190),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.bg,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              offset: const Offset(1, 1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          children: [
            const Text(
              'Your score',
              style: TextStyle(
                fontFamily: 'Fredoka',
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColors.darkText,
              ),
            ),

            // Score number over the Roman Crown image
            SizedBox(
              height: 140,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    ProductAssets.romanCrown,
                    width: 277,
                    height: 140,
                    fit: BoxFit.contain,
                  ),

                  if (isNewBest) ...[
                    Positioned(
                      bottom: 10,
                      child: const Text(
                        'New Best 🎉',
                        style: TextStyle(
                          fontFamily: 'Fredoka',
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: AppColors.darkText,
                        ),
                      ),
                    ),
                  ],

                  // Final Score
                  Text(
                    '$score',
                    style: const TextStyle(
                      fontFamily: 'Fredoka',
                      fontWeight: FontWeight.w600,
                      fontSize: 64,
                      color: AppColors.darkText,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ---------- "You earned" panel ----------
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 17,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.orange.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        ProductAssets.brain,
                        width: 60,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'You earned',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: AppColors.darkText,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '+$starsEarned⭐',
                              style: const TextStyle(
                                fontFamily: 'Fredoka',
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: AppColors.darkText,
                              ),
                            ),
                            const SizedBox(height: 3),
                            const Text(
                              "Keep it up. you're on fire",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.darkText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        ProductAssets.treasureChest,
                        width: 90,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                // Gradient "+120⭐" badge overlapping the bottom-right
                Positioned(
                  right: 16,
                  bottom: -14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(
                            0xFFFF3200,
                          ).withValues(alpha: 0.65),
                          const Color(
                            0xFF991E00,
                          ).withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                    child: Text(
                      '+$starsEarned⭐',
                      style: const TextStyle(
                        fontFamily: 'Fredoka',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.darkText,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // ---------- Play again button ----------
            SizedBox(
              width: double.infinity,
              child: Material(
                color: AppColors.deepPurple,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    // TODO: hook up play-again logic
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.replay,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Play again',
                          style: TextStyle(
                            fontFamily: 'Fredoka',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ---------- Review Answers / Back to home ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: AppColors.darkText.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      // TODO: navigate to review-answers screen
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      child: Text(
                        'Review Answers',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                Material(
                  color: AppColors.orange.withValues(alpha: 0.31),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MainNavigation(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      child: Text(
                        'Back to home',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
