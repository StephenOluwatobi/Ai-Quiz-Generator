import 'package:ai_quiz_generator/app/navigation/main_navigation.dart';

import 'package:flutter/material.dart';

// Sets up the app-wide Material design settings and starting screen.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hides Flutter's development label from the finished app.
      debugShowCheckedModeBanner: false,
      home: MainNavigation(),
    );
  }
}
