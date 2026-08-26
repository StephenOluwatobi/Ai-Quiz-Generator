
import 'package:flutter/material.dart';

// Groups the user's main quiz statistics in one small card.
class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFEF0D0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: 59.0,
      width: 360.0,
      // Spreads the three statistics evenly across the card.
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Text(
                  "🔥7",
                  style: TextStyle(
                    fontFamily: 'Fredoka',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    height: 1.0,
                    letterSpacing: 0.0,
                    color: Color(0xff2D1654),
                  ),
                ),
                Text("Best Score"),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Text(
                  "🏆10",
                  style: TextStyle(
                    fontFamily: 'Fredoka',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    height: 1.0,
                    letterSpacing: 0.0,
                    color: Color(0xff2D1654),
                  ),
                ),
                Text("Quizzes Taken"),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Text(
                  "🎯50%",
                  style: TextStyle(
                    fontFamily: 'Fredoka',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    height: 1.0,
                    letterSpacing: 0.0,
                    color: Color(0xff2D1654),
                  ),
                ),

                Text("Day Streak"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
