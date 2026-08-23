import 'dart:convert';
import 'package:ai_quiz_generator/shared/models/quiz_question.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiQuizService {
  late final GenerativeModel _model;

  GeminiQuizService() {
    final apiKey = dotenv.env['API_KEY'];

    if (apiKey == null) {
      throw Exception('API_KEY is missing from the .env file.');
    }

    // Initialize the model and force it to return JSON
    _model = GenerativeModel(
      model: 'gemini-3.6-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
      ),
    );
  }

  Future<List<QuizQuestion>?> generateQuizQuestions(
    String topic,
  ) async {
    // 1. The Prompt Engineering
    final prompt =
        '''
      You are an expert quiz generator. Generate a multiple-choice quiz about "$topic".
      Return strictly a JSON array of 10 questions.
      Each object in the array must have exactly this structure:
      {
        "question": "The question text",
        "options": ["Option A", "Option B", "Option C", "Option D"],
        "correctAnswerIndex": 0 
      }
      Ensure the "correctAnswerIndex" is an integer from 0 to 3 matching the correct option.
    ''';

    try {
      // 2. Send the request to Gemini
      final response = await _model.generateContent([
        Content.text(prompt),
      ]);

      // 3. Parse the JSON string into Dart objects
      if (response.text != null) {
        final List<dynamic> jsonList = jsonDecode(response.text!);
        return jsonList
            .map((json) => QuizQuestion.fromJson(json))
            .toList();
      }
    } catch (e) {
      print('Error generating quiz: $e');
      return null;
    }
    return null;
  }
}
