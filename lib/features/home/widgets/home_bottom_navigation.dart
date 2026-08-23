import 'package:ai_quiz_generator/core/utils/assets_string.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem(ProductAssets.homeIcon, "Home", 0),
          // navItem(ProductAssets.clock, "History", 1),
          navItem(ProductAssets.crown, "Leaderboard", 2),
          navItem(ProductAssets.profile, "Profile", 3),
        ],
      ),
    );
  }

  Widget navItem(String imagePath, String label, int index) {
    final bool selected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        onItemTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            color: selected
                ? const Color(0xffF86A47)
                : const Color(0xff72678E),
          ),
          Text(
            label,
            style: TextStyle(
              color: selected
                  ? const Color(0xffF86A47)
                  : const Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
