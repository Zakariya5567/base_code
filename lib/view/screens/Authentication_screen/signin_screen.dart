import 'dart:io';
import 'package:base_code/view/screens/Authentication_screen/components/google_signin_section.dart';
import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../utils/colors.dart';
import '../../../helper/routes_helper.dart';
import '../../../helper/validation.dart';
import '../../../provider/authentication_provider.dart';
import '../../../utils/images.dart';
import '../../../utils/string.dart';
import '../../../utils/style.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';
import 'components/logo_section.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //Scaffold key
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // Form key
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: blueStatusBar(),
      child: SafeArea(
        key: scaffoldKey,
        bottom: Platform.isAndroid ? true : false,
        top: Platform.isAndroid ? true : false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: greenSecondary,
          body: Consumer<AuthProvider>(builder: (context, controller, child) {
            return Container(
              height: 844.h,
              width: 390.w,
              decoration: BoxDecoration(gradient: gradientBlue),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LogoSection(
                        image: Images.logoImage, title: signInWithDripX),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 35.w, vertical: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              controller: controller.signInEmailController,
                              hintText: hintEmail,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                return Validation.emailValidation(value);
                              },
                            ),
                            17.height,
                            CustomTextField(
                              controller: controller.signInPasswordController,
                              hintText: hintPassword,
                              isPassword: true,
                              isVisible: controller.isVisible,
                              obscureText: controller.isVisible,
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              onEyeTap: () {
                                controller.passwordVisibility();
                              },
                              validator: (value) {
                                return Validation.passwordValidation(value);
                              },
                            ),
                            20.height,
                            textBtnForgotPassword
                                .toText(
                                    fontSize: 14,
                                    color: whiteSecondary,
                                    fontFamily: sofiaRegular)
                                .align(Alignment.centerRight)
                                .onPress(() {
                              // Navigator.pushNamed(
                              //     context, RouterHelper.forgotPasswordScreen);
                            }),
                            27.height,
                            CustomButton(
                              buttonName: btnSignIn,
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  // Navigator.pushNamed(
                                  //     context, RouterHelper.homeScreen);
                                  FocusManager.instance.primaryFocus?.unfocus();
                                }
                              },
                            ),
                            25.height,
                            const GoogleSignInSection(),
                            15.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                doNotHaveAnAccount.toText(
                                    fontSize: 16,
                                    color: whitePrimary,
                                    fontFamily: sofiaLight),
                                btnSignUp
                                    .toText(
                                        fontSize: 16,
                                        color: purplePrimary,
                                        fontFamily: sofiaRegular)
                                    .onPress(() {
                                  Navigator.pushNamed(
                                      context, RouterHelper.signUpScreen);
                                })
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
