class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });

  // This factory constructor takes the raw JSON map from Gemini 
  // and safely converts it into a QuizQuestion object.
  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      question: json['question'] as String,
      // We map over the dynamic list to ensure everything is strictly a String
      options: (json['options'] as List<dynamic>).map((e) => e.toString()).toList(),
      correctAnswerIndex: json['correctAnswerIndex'] as int,
    );
  }
}