import 'package:ai_quiz_generator/core/utils/assets_string.dart';
import 'package:ai_quiz_generator/features/quiz/screens/quiz_loading_screen.dart';
import 'package:flutter/material.dart';

// Collects a topic from the user before opening the quiz loading screen.
class QuizGeneratorCard extends StatefulWidget {
  const QuizGeneratorCard({super.key});

  @override
  State<QuizGeneratorCard> createState() => _QuizGeneratorCardState();
}

class _QuizGeneratorCardState extends State<QuizGeneratorCard> {
  // The controller to capture the typed text
  final TextEditingController _topicController =
      TextEditingController();

  // A switch to track if Gemini is currently thinking

  // Keeps the button disabled while a quiz is being prepared.
  final bool _isLoading = false;

  // Cleanup to prevent memory leaks

  @override
  void dispose() {
    _topicController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 270,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF86A47),

        borderRadius: BorderRadius.circular(24.0),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white24,
                ),
                child: Image.asset(
                  ProductAssets.airobot,
                  height: 80,
                  width: 80,
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: const Text(
                        'What do you want\nto be quizzed on?',
                        style: TextStyle(
                          fontFamily: 'Fredoka',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                          height: 1.0,
                          letterSpacing: 0.0,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),

          //Text field
          // Lets the user choose the subject for their new quiz.
          SizedBox(
            width: 312,
            height: 56,
            child: TextField(
              controller: _topicController,

              decoration: InputDecoration(
                hintText: 'Type a or ask any question',
                hintStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                  letterSpacing: 0.0,
                  color: Color(0xff8C8D9C),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),

                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Color(
                        0xFFFFC107,
                      ), // Yellow circle background
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.mic,
                      color: Colors.black87,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bottom Row: Generate Quiz Button
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 14,
                right: 10,
                bottom: 14,
                left: 10,
              ),
              child: SizedBox(
                width: 281,
                height: 47,
                child: ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          // 1. Grab the text from the controller and remove extra spaces
                          final topic = _topicController.text.trim();

                          // 2. Safety check: Did they actually type anything?
                          if (topic.isEmpty) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please type a topic first!',
                                ),
                              ),
                            );
                            return; // Stop the code right here if the field is empty
                          }
                          // Opens the loading screen with the chosen topic.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  QuizLoadingScreen(topic: topic),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xff351C62,
                    ), // Deep dark navy blue
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Generate Quiz',
                    style: TextStyle(
                      fontFamily: 'Fredoka',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                      letterSpacing: 0.0,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
