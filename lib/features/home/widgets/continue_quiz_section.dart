
import 'package:flutter/material.dart';

// Displays the heading for quizzes the user can pick up again.
class ContinueQuizSection extends StatelessWidget {
  const ContinueQuizSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 19.0,
            child: Text(
              "Continue your quizzes",
              style: TextStyle(
                fontFamily: 'Fredoka',
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                height: 1.0,
                letterSpacing: 0.0,
                color: Color(0xff2D1654),
              ),
            ),
          ),
    
          SizedBox(
            height: 19.0,
            child: Text(
              "View all",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                height: 1.0,
                letterSpacing: 0.0,
                color: Color(0xffF86A47),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
