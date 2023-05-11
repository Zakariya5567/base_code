import 'dart:async';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../helper/routes_helper.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimension.dart';
import '../../../utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    handleNotification();
    routes();
  }

  // Calling notification for listen the app is in which state (foreground,background,terminated)
  handleNotification() async {
    //await NotificationService().handleNotification(context);
  }

  void routes() async {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(RouterHelper.signUpScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQuerySize(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: blueStatusBar(),
      child: Scaffold(
          body: Container(
        height: 844.h,
        width: 390.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(Images.splashImage))),
        child: Center(
          child: Image.asset(
            Images.logoWithNameImage,
            height: 195.h,
            width: 120.w,
          ),
        ),
      )),
    );
  }
}
