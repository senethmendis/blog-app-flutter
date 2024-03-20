import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:flutter/material.dart';

class CustomActionBar extends StatelessWidget {
  const CustomActionBar({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomPoppingText(
                  text: "Explore Today's",
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                CustomPoppingText(
                  text: "World News",
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
