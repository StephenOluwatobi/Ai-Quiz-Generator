import 'package:flutter/material.dart';

// Shows the remaining quiz time as a number and a shrinking ring.
class QuizCountDownTimer extends StatefulWidget {
  const QuizCountDownTimer({
    super.key,
    required this.onTimerFinished,
    required this.timeLeft,
  });
  // Receives the remaining time from the screen that owns the timer.
  final int timeLeft;
  final VoidCallback onTimerFinished;
  @override
  State<QuizCountDownTimer> createState() => _QuizCountDownState();
}

class _QuizCountDownState extends State<QuizCountDownTimer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 59,
      width: 59,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer Progress Ring
          SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              // Converts seconds left into the fraction needed by the progress ring.
              value: widget.timeLeft / 60,
              strokeWidth: 4.0,
              backgroundColor: Color(0xffFC6643),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xfffcece9),
              ),
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.timeLeft.toString(),
                style: const TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  height: 1.1,
                ),
              ),

              const Text(
                'sec',
                style: TextStyle(
                  fontFamily: 'Fredoka',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 1.1,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
