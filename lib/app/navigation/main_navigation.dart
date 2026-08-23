import 'package:flutter/material.dart';
import 'package:ai_quiz_generator/features/home/screens/home_screen.dart';
import 'package:ai_quiz_generator/features/home/widgets/home_bottom_navigation.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: HomeBottomNavigation(
        currentIndex: currentIndex,
        onItemTapped: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
