import 'package:blog_app/components/custom_text/custom_poppingtext.dart';
import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon(
      {super.key,
      required this.text,
      required this.onTap,
      this.width = 150,
      this.icon = Icons.phone,
      this.color = Colors.pink,
      this.buttonVisibility = false,
      this.height = 40});

  final String text;
  final double width;
  final double height;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool buttonVisibility;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPoppingText(
                text: text,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Visibility(
                  visible: buttonVisibility,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
