import 'package:flutter/material.dart';

class TopicSection extends StatelessWidget {
  const TopicSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 19.0,
            child: Text(
              "Try these topics",
              style: TextStyle(
                fontFamily: 'Fredoka',
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                height: 1.0,

                letterSpacing: 0.0,
                color: Color(0xff2D1654),
              ),
            ),
          ),

          SizedBox(
            height: 19.0,
            child: Text(
              "See all",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                height: 1.0,
                letterSpacing: 0.0,
                color: Color(0xffF86A47),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
