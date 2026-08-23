import 'package:ai_quiz_generator/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // Ensure Flutter is fully initialized before loading the .env file

  WidgetsFlutterBinding.ensureInitialized();
  // Load the environment variables
  await dotenv.load(fileName: '.env');

  runApp(const App());
}
