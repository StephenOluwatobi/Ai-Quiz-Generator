import 'package:ai_quiz_generator/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Starts the app after the settings it needs have been loaded.
void main() async {
  // Ensure Flutter is fully initialized before loading the .env file

  WidgetsFlutterBinding.ensureInitialized();
  // Load the environment variables
  await dotenv.load(fileName: '.env');

  // Adds the app widget to the screen.
  runApp(const App());
}
