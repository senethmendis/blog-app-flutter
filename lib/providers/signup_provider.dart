import 'package:blog_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignUpProvider extends ChangeNotifier {
  AuthController authController = AuthController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  TextEditingController get nameController => _nameController;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  Future<void> startSignUp() async {
    if (_nameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty ||
        _passwordController.text != _confirmPasswordController.text) {
      Logger().e("Invalid Data");
    } else {
      authController
          .createAccount(
        name: _nameController.text,
        email: emailController.text,
        password: passwordController.text,
      )
          .then(((value) {
        if (value) {
          clearTextFileds();
        }
      }));
    }
  }

  void clearTextFileds() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _nameController.clear();

    notifyListeners();
  }
}
