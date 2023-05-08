import 'dart:io';
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
import '../../widgets/extention/border_extension.dart';
import 'components/google_signin_section.dart';
import 'components/logo_section.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
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
                        image: Images.logoImage, title: signUpWithDripX),
                    Form(
                      key: formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 35.w, vertical: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              controller: controller.signUpNameController,
                              hintText: hintFullName,
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                return Validation.nameValidation(value);
                              },
                            ),
                            17.height,
                            CustomTextField(
                              controller: controller.signUpEmailController,
                              hintText: hintEmail,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                return Validation.emailValidation(value);
                              },
                            ),
                            27.height,
                            CustomTextField(
                              controller: controller.signUpPasswordController,
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
                            27.height,
                            CustomButton(
                              buttonName: btnSignUp,
                              onPressed: () async {
                                controller.phoneValidator();
                                if (formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                }
                              },
                            ),
                            25.height,
                            const GoogleSignInSection(),
                            18.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                alreadyHaveAnAccount.toText(
                                    fontSize: 16,
                                    color: whitePrimary,
                                    fontFamily: sofiaLight),
                                btnSignIn
                                    .toText(
                                        fontSize: 16,
                                        color: purplePrimary,
                                        fontFamily: sofiaRegular)
                                    .onPress(() {
                                  Navigator.pushNamed(
                                      context, RouterHelper.signInScreen);
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
