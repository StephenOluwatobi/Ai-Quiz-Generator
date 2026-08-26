import 'package:ai_quiz_generator/app/navigation/main_navigation.dart';
import 'package:ai_quiz_generator/features/quiz/widgets/quiz_question_screens/answer_option.dart';
import 'package:ai_quiz_generator/features/quiz/widgets/quiz_question_screens/quiz_count_down.dart';
import 'package:ai_quiz_generator/features/quiz/widgets/quiz_question_screens/quiz_progress_indicator.dart';
import 'package:ai_quiz_generator/features/quiz/widgets/quiz_question_screens/quiz_questions..dart';

import 'package:ai_quiz_generator/shared/models/quiz_question.dart';
import 'package:flutter/material.dart';

// Shows one quiz question, its timer, progress, and answer choices.
class QuestionCard extends StatefulWidget {
  const QuestionCard({
    super.key,
    required this.currentQuizquestion,
    required this.questionIndex,
    required this.totalQuestions,
    required this.timeLeft,
    required this.onCorrectAnswer,
  });

  // Store the question so we can use it below
  final QuizQuestion currentQuizquestion;

  // Tells the card where this question sits in the quiz.
  final int questionIndex;
  // Lets the progress label and bars show the full quiz length.
  final int totalQuestions;
  // Passes the remaining quiz time to the countdown display.
  final int timeLeft;
  // Sends a score update to the screen that owns the quiz.
  final VoidCallback onCorrectAnswer;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  // Remembers the first answer tapped so answers cannot be changed afterwards.
  String? selectedAnswer;
  // Marks the selected answer and informs the quiz screen when it is correct.
  void _onAnswerTapped(String tappedOption) {
    // this stops the user from changing answer after seeing if it is wrong

    if (selectedAnswer != null) return;
    setState(() {
      selectedAnswer = tappedOption;
    });
    // Figure out which number goes with letter they tapped

    int tappedIndex = -1;

    if (tappedOption == 'A') {
      tappedIndex = 0;
    } else if (tappedOption == 'B') {
      tappedIndex = 1;
    } else if (tappedOption == 'C') {
      tappedIndex = 2;
    } else if (tappedOption == 'D') {
      tappedIndex = 3;
    }
    // Check if their number matches the actuqal correct answer number
    if (tappedIndex ==
        widget.currentQuizquestion.correctAnswerIndex) {
      // They got it right! Send the signal up the pipe!
      widget.onCorrectAnswer();
    }
  }

  Color _getButtonColor(String optionLetter, String optionText) {
    // If the user hasn't tapped anything yet, keep all buttons white
    if (selectedAnswer == null) {
      return const Color(0xffffffff);
    }

    // Figure out the actual correct text for this specific question
    String expectedCorrectAnswer = widget
        .currentQuizquestion
        .options[widget.currentQuizquestion.correctAnswerIndex];

    // Check if the current button being drawn iS the correct answer
    bool isThisOptionCorrect =
        optionText.trim().toLowerCase() ==
        expectedCorrectAnswer.trim().toLowerCase();

    // If this button is the correct answer, ALWAYS make it green (even if they didn't tap it!)
    if (isThisOptionCorrect) {
      return Colors.green;
    }

    // If this button is the one they tapped, and it's NOT correct, make it red
    if (selectedAnswer == optionLetter) {
      return Colors.red;
    }

    // For all the other unselected, wrong buttons, keep them white
    return const Color(0xffffffff);
  }

  @override
  Widget build(BuildContext context) {
    // Keeps the quiz controls together inside one card.
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 20.0,
        left: 5.0,
        right: 5.0,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xffFFFEFE),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withValues(alpha: 0.12),
              offset: const Offset(1, 1),
              blurRadius: 10.2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      // Returns the user to the main navigation area.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MainNavigation(),
                        ),
                      );
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minHeight: 28.0,
                      maxWidth: 28.0,
                    ),

                    icon: const Icon(
                      Icons.close,
                      color: Color(0xff201343),
                    ),
                  ),

                  // Shows the user's current place in the quiz.
                  Text(
                    "Question ${widget.questionIndex + 1} of ${widget.totalQuestions}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                      color: Color(0xff201343),
                    ),
                  ),

                  // Countdown timer
                  QuizCountDownTimer(
                    onTimerFinished: () {
                      print('TIME IS UP');
                    },
                    timeLeft: widget.timeLeft,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            // progress
            QuizProgressIndicator(
              currentIndex: widget.questionIndex,
              totalQuestions: widget.totalQuestions,
            ),

            SizedBox(height: 10.0),

            // Quiz Topic
            QuizQuestions(
              questionText: widget.currentQuizquestion.question,
            ),

            SizedBox(height: 30.0),

            // Quiz Image

            // QuizImage(),
            const SizedBox(height: 20),
            // Each option uses the same layout but a different answer from the quiz.
            AnswerOptions(
              option: 'A',
              question: widget.currentQuizquestion.options[0],
              backgroundColor: _getButtonColor(
                'A',
                widget.currentQuizquestion.options[0],
              ),
              answerTaped: () => _onAnswerTapped('A'),
            ),
            const SizedBox(height: 20),
            AnswerOptions(
              option: 'B',
              question: widget.currentQuizquestion.options[1],
              backgroundColor: _getButtonColor(
                'B',
                widget.currentQuizquestion.options[1],
              ),
              answerTaped: () => _onAnswerTapped('B'),
            ),
            const SizedBox(height: 20),
            AnswerOptions(
              option: 'C',
              question: widget.currentQuizquestion.options[2],
              backgroundColor: _getButtonColor(
                'C',
                widget.currentQuizquestion.options[2],
              ),
              answerTaped: () => _onAnswerTapped('C'),
            ),
            const SizedBox(height: 20),
            AnswerOptions(
              option: 'D',
              question: widget.currentQuizquestion.options[3],
              backgroundColor: _getButtonColor(
                'D',
                widget.currentQuizquestion.options[3],
              ),
              answerTaped: () => _onAnswerTapped('D'),
            ),
          ],
        ),
      ),
    );
  }
}
