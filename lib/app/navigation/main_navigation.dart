import 'package:flutter/material.dart';
import 'package:ai_quiz_generator/features/home/screens/home_screen.dart';
import 'package:ai_quiz_generator/features/home/widgets/home_bottom_navigation.dart';

// Holds the main screens and the navigation bar used to switch between them.
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // Keeps track of the navigation item the user selected.
  int currentIndex = 0;

  // Matches each navigation item with the screen it should show.
  final screens = [
    const HomeScreen(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Displays the screen that matches the selected navigation item.
      body: screens[currentIndex],

      bottomNavigationBar: HomeBottomNavigation(
        currentIndex: currentIndex,
        // Rebuilds the page when the user chooses another item.
        onItemTapped: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
