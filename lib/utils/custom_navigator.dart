import 'package:flutter/material.dart';

class CustomNavigator {
  static void goto(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
