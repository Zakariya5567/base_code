import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isVisible = false;

  passwordVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  confirmPasswordValidation(String value) {
    if (value.isEmpty) {
      return "Enter your password";
    } else if (confirmPasswordController.text != newPasswordController.text) {
      return "Password doesn't matched";
    }
  }
}
