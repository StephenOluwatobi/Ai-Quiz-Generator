import 'package:ai_quiz_generator/core/services/gemini_quiz_service.dart';
import 'package:ai_quiz_generator/core/utils/assets_string.dart';
import 'package:ai_quiz_generator/features/quiz/screens/quiz_question_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// Shows a loading animation while Gemini creates questions for a topic.
class QuizLoadingScreen extends StatefulWidget {
  const QuizLoadingScreen({super.key, required this.topic});

  final String topic;

  @override
  State<QuizLoadingScreen> createState() => _QuizLoadingScreenState();
}

class _QuizLoadingScreenState extends State<QuizLoadingScreen> {
  // Controls the looping loading video.
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      ProductAssets.loadingScreen,
    );

    _controller.initialize().then((_) {
      setState(() {});
    });

    _controller.setLooping(true);

    _controller.play();

    _fetchQuiz();
  }

  // Gets the questions, then replaces this screen with the quiz when ready.
  Future<void> _fetchQuiz() async {
    // ask gemini for the questions using the topic passed to this screen
    final quizService = GeminiQuizService();
    final questions = await quizService.generateQuizQuestions(
      widget.topic,
    );

    // check if the user hit the back button before gemini finished?
    // if they did, we stop right here so the  app does not crash
    if (!mounted) return;

    // check if we actuall got question back
    if (questions != null && questions.isNotEmpty) {
      // success! Swap this loading screen out for the actual Quiz Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              QuizQuestionScreen(questions: questions),
        ),
      );
    } else {
      // failure show an error message and go back to the home screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to generate quiz, try again'),
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff8f0),
      body: Center(
        // Uses a still image until the video has finished starting up.
        child: _controller.value.isInitialized
            ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              )
            : Image.asset(
                ProductAssets.loadingImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
      ),
    );
  }
}
