
import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:flutter/material.dart';

class SectionBreaker extends StatelessWidget {
  const SectionBreaker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPoppingText(
          text: "For You",
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        Icon(
          Icons.grid_view_rounded,
          size: 40,
        )
      ],
    );
  }
}
