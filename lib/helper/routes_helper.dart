import 'package:flutter/material.dart';
import '../view/screens/Authentication_screen/signin_screen.dart';
import '../view/screens/Authentication_screen/signup_screen.dart';
import '../view/screens/connection_screen/connection_error_screen.dart';
import '../view/screens/splash_screen/splash_screen.dart';

class RouterHelper {
  static const initial = "/";
  static const signUpScreen = "/signUpScreen";
  static const signInScreen = "/signInScreen";
  static const noConnectionScreen = "/noConnectionScreen";

  static Map<String, Widget Function(BuildContext context)> routes = {
    initial: (context) => const SplashScreen(),
    noConnectionScreen: (context) => const NoConnection(),
    signUpScreen: (context) => const SignUpScreen(),
    signInScreen: (context) => const SignInScreen(),
  };
}
