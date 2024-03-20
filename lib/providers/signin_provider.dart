import 'package:blog_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignInProvider extends ChangeNotifier {
  AuthController authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _resetEmailController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get resetEmailController => _resetEmailController;

  Future<void> startSignIn() async {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {
      Logger().e("Invalid Data");
    } else {
      await authController
          .signInWithPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) => clearTextFileds());
    }
  }

  Future<void> sendResetEmail() async {
    if (resetEmailController.text.trim().isEmpty) {
      Logger().e("Plase Enter Your Email");
    } else {
      authController
          .sendPasswordResetEmail(resetEmailController.text)
          .then((value) => Logger().i("Email Sent!!!!"))
          .then((value) => resetEmailController.clear());
    }
  }

  void clearTextFileds() {
    _emailController.clear();
    _passwordController.clear();
    notifyListeners();
  }
}
