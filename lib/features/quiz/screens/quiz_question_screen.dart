import 'dart:async';

import 'package:ai_quiz_generator/features/quiz/screens/quiz_result_screen.dart';
import 'package:ai_quiz_generator/features/quiz/widgets/quiz_question_screens/question_card.dart';

import 'package:flutter/material.dart';
import 'package:ai_quiz_generator/shared/models/quiz_question.dart';

// Runs a quiz one question at a time and keeps the score for this attempt.
class QuizQuestionScreen extends StatefulWidget {
  const QuizQuestionScreen({super.key, required this.questions});

  // store the list
  // Contains the questions created for the user's chosen topic.
  final List<QuizQuestion> questions;
  @override
  State<QuizQuestionScreen> createState() =>
      _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  // The reason why i am put this here is because i do not want the timer to start from the beginnig when the user move to the next question.

  // Points to the question currently shown to the user.
  int _currentIndex = 0;
  // Counts down the time allowed for the quiz.
  int timeLeft = 60;
  // Updates the countdown once each second.
  Timer? _timer;
  // Adds points whenever the user selects a correct answer.
  int currentScore = 0;

  // Starts one timer for the full quiz instead of restarting it per question.
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        _timer?.cancel();

        //Todo this part will end the quiz when the timer runs out

        print("end the quiz");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  // Stops the timer when this screen is no longer open.
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff8f0),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              // Quiz Card
              child: QuestionCard(
                key: ValueKey(_currentIndex),
                currentQuizquestion: widget.questions[_currentIndex],
                questionIndex: _currentIndex,
                totalQuestions: widget.questions.length,
                // Receives score updates from the answer card.
                timeLeft: timeLeft, onCorrectAnswer: () { setState(() {
                  currentScore += 10;
                }); },
              ),
            ),

            SizedBox(
              width: 281,
              height: 47,
              child: ElevatedButton(
                // Moves through the questions, then shows the final result.
                onPressed: () {
                  // Check if we are at the very last question

                  if (_currentIndex < widget.questions.length - 1) {
                    // If not just move to the next question
                    setState(() {
                      _currentIndex++;
                    });
                  } else {
                    //if it is the last question, go back to the for now

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                             QuizResultScreen( score: currentScore),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xff351C62,
                  ), 
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: 'Fredoka',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                    letterSpacing: 0.0,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
