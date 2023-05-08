import 'package:flutter/material.dart';

import '../data/model/authentication/signup_model.dart';
import '../data/repository/api_repo.dart';
import '../utils/api_url.dart';
import '../view/widgets/loader_dialog.dart';

class AuthProvider extends ChangeNotifier {
  // Sign up controller
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();

  // Sign in Controller

  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  // Reset password controller
  TextEditingController resetPasswordController = TextEditingController();

  // new password controller
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Otp controller
  TextEditingController otpController = TextEditingController();

  bool isVisible = false;
  bool? isPhoneValid;
  String? phoneValidText;
  bool? otpReceived;

  setOtpValidation(bool value) {
    otpReceived = value;
    notifyListeners();
  }

  passwordVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  phoneValidator() {
    if (signUpPhoneController.text.isEmpty) {
      phoneValidText = "Enter Your Phone Number";
      isPhoneValid = false;
      notifyListeners();
    } else {
      isPhoneValid = true;
      phoneValidText = null;
      notifyListeners();
    }
  }

  // Phone text field validation
  phoneValidation(String value) {
    String pattern = r'^(?:[+0][1-9])?[0-9]{11}$';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      phoneValidText = "Enter Your Phone Number";
      isPhoneValid = false;
      notifyListeners();
      return "Enter Your Phone Number";
    } else if (!regExp.hasMatch(value)) {
      phoneValidText = "Enter Valid Phone Number";
      isPhoneValid = false;
      notifyListeners();
      return "Enter Valid Phone Number";
    } else {
      isPhoneValid = true;
      phoneValidText = null;
      notifyListeners();
    }
  }

  // confirm password  validation
  confirmPasswordValidation(String value) {
    if (value.isEmpty) {
      return "Enter your password";
    } else if (confirmPasswordController.text != newPasswordController.text) {
      return "Password doesn't matched";
    }
  }

//=================================================================================
}
