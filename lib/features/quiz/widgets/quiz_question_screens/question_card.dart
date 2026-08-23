import 'package:ai_quiz_generator/app/navigation/main_navigation.dart';
import 'package:ai_quiz_generator/features/quiz/widgets/quiz_question_screens/answer_option.dart';
import 'package:ai_quiz_generator/features/quiz/widgets/quiz_question_screens/quiz_count_down.dart';
import 'package:ai_quiz_generator/features/quiz/widgets/quiz_question_screens/quiz_progress_indicator.dart';
import 'package:ai_quiz_generator/features/quiz/widgets/quiz_question_screens/quiz_questions..dart';

import 'package:ai_quiz_generator/shared/models/quiz_question.dart';
import 'package:flutter/material.dart';

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

  final int questionIndex;
  final int totalQuestions;
  final int timeLeft;
  final VoidCallback onCorrectAnswer;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  String? selectedAnswer;
  void _onAnswerTapped(String tappedOption) {
    // this stops the user from changing answer after seeing if it is wrong

    if (selectedAnswer != null) return;
    setState(() {
      selectedAnswer = tappedOption;
    });
    // Figure out which number goes with letter they tapped

    int tappedIndex = 0;
    if (tappedOption == 'A')
      tappedIndex = 0;
    else if (tappedOption == 'B')
      tappedIndex = 1;
    else if (tappedOption == 'C')
      tappedIndex = 2;
    else if (tappedOption == 'D')
      tappedIndex = 3;

    // Check if their number matches the actuqal correct answer number
    if (tappedIndex ==
        widget.currentQuizquestion.correctAnswerIndex) {
      // They got it right! Send the signal up the pipe!
      widget.onCorrectAnswer();
    }
  }

  Color _getButtonColor(String optionLetter, String optionText) {
    if (selectedAnswer == null) {
      return const Color(0xffffffff);
    }
    if (selectedAnswer == optionLetter) {
      String expectedCorrectAnswer = widget
          .currentQuizquestion
          .options[widget.currentQuizquestion.correctAnswerIndex];

      //print("BUTTON TAPPED : '$optionText'");
      //print("CORRECT ANSWER: '$expectedCorrectAnswer' ");

      if (optionText.trim().toLowerCase() ==
          expectedCorrectAnswer.trim().toLowerCase()) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    }
    return const Color(0xffffffff);
  }

  @override
  Widget build(BuildContext context) {
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
            QuizProgressIndicator(),

            SizedBox(height: 10.0),

            // Quiz Topic
            QuizQuestions(
              questionText: widget.currentQuizquestion.question,
            ),

            SizedBox(height: 30.0),

            // Quiz Image

            // QuizImage(),
            const SizedBox(height: 20),
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
