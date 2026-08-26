import 'package:flutter/material.dart';

// Displays a compact summary of a quiz and its saved score.
class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.title,
    required this.score,
    required this.image,
  });

  // Supplies the quiz details so the same card layout can show different quizzes.
  final String title;
  final int score;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162,
      height: 116,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Quiz image
          Positioned(
            left: 6,
            top: 0,
            child: Image.asset(image, width: 40, height: 59),
          ),

          // Quiz title
          Positioned(
            left: 13,
            top: 46,
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                height: 1.0,
                letterSpacing: 0.0,
                color: Color(0xff000000),
              ),
            ),
          ),

          // Number of questions
          Positioned(
            left: 13,
            top: 61,
            child: Text(
              '10 Questions',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11.0,
                fontWeight: FontWeight.w400,
                height: 1.0,
                letterSpacing: 0.0,
                color: Color(0xff000000),
              ),
            ),
          ),

          // Progress Circle
          Positioned(
            right: 8,
            top: 17,
            child: SizedBox(
              height: 40.0,
              width: 40.0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Turns the saved score into a quick visual progress ring.
                  CircularProgressIndicator(
                    value: score / 100,
                    strokeWidth: 6.0,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xff76CB82),
                    ),
                  ),

                  Text(
                    '$score%',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      fontSize: 11.0,
                      letterSpacing: 0.0,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Retake button
          Positioned(
            left: 15.0,
            bottom: 11.0,
            child: Container(
              width: 135.0,
              height: 21.0,
              decoration: BoxDecoration(
                color: const Color(0xffF2EBFE),
                borderRadius: BorderRadius.circular(20.0),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Retake quiz',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                  height: 1.0,
                  letterSpacing: 0.0,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
