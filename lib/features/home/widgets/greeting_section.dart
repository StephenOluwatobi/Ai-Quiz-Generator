import 'package:flutter/material.dart';

// Displays the personal welcome message at the top of the home screen.
class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              "Hey, Tobi!",
              style: TextStyle(
                fontFamily: 'Fredoka',
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                height: 1.0,
                letterSpacing: 0.0,
                color: Color(0xFF2d1654),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Ready to learn Somthing fun Today?",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14.0,
                fontWeight: FontWeight.w400,

                height: 1.0,
                letterSpacing: 0.0,
                color: Color(0xFF2d1654),
              ),
            ),
          ],
        ),

        // Shows a simple circular avatar beside the greeting.
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 40),
          child: Container(
            padding: EdgeInsets.only(top: 18, bottom: 18, left: 24),
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: const Color(0xfffee7ad),
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(
                color: const Color(0xFFFFFFFF),
                width: 4.0,
              ),
            ),
            child: Text(
              'T',
              style: TextStyle(
                fontFamily: 'Fredoka',
                fontSize: 36.0,
                fontWeight: FontWeight.w600,
                height: 1.0,
                letterSpacing: 0.0,
                color: Color(0xFF2d1654),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
