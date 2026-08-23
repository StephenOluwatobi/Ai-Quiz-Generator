
import 'package:ai_quiz_generator/core/utils/assets_string.dart';
import 'package:flutter/material.dart';

class TopicCards extends StatelessWidget {
  const TopicCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // First Container
            Container(
              height: 107.0,
              width: 89.0,
    
              decoration: BoxDecoration(
                color: Color(0xffFDDDD4),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    ProductAssets.movie,
                    height: 80.0,
                    width: 56.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: Text(
                      'Movies',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                        letterSpacing: 0.0,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            // Second Container
            Container(
              height: 107.0,
              width: 89.0,
              decoration: BoxDecoration(
                color: Color(0xffFEE59F),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    ProductAssets.music,
                    height: 80.0,
                    width: 56.0,
                  ),
    
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: Text(
                      'Music',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                        letterSpacing: 0.0,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            // Third Containe
            Container(
              height: 107.0,
              width: 89.0,
    
              decoration: BoxDecoration(
                color: Color(0xffFDDDD4),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    ProductAssets.scienceImage,
                    height: 80.0,
                    width: 56.0,
                  ),
    
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: Text(
                      'Science',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                        letterSpacing: 0.0,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            //Forth Container
            Container(
              height: 107.0,
              width: 89.0,
              decoration: BoxDecoration(
                color: Color(0xffFDDDD4),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    ProductAssets.earth,
                    height: 80.0,
                    width: 56.0,
                  ),
    
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: Text(
                      'History',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                        letterSpacing: 0.0,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
