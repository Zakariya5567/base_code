import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../data/db/shared-preferences.dart';
import '../data/model/authentication/signup_model.dart';
import '../data/repository/api_repo.dart';
import '../data/repository/firebase_repo.dart';
import '../utils/api_url.dart';
import '../view/widgets/loader_dialog.dart';
import '../view/widgets/toast_message.dart';

class AuthProvider extends ChangeNotifier {
  // Sign up controller
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPhoneController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();

  // Sign in Controller

  TextEditingController signInEmailController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();

  // new password controller
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Otp controller
  TextEditingController otpController = TextEditingController();

  bool? isLoading;
  bool isVisible = false;
  bool? isPhoneValid;
  String? phoneValidText;
  bool? otpReceived;
  BuildContext? context;
  ApiRepo apiRepo = ApiRepo();
  SignupModel signupModel = SignupModel();

  // Set context and navigator
  setContext({required context}) {
    this.context = context;
    notifyListeners();
  }

  // Dialog Loader
  setLoading(bool value) {
    isLoading = value;
    if (value == true) {
      loaderDialog(context!);
    } else {
      Navigator.of(context!).pop();
    }
    notifyListeners();
  }

  setOtpValidation(bool value) {
    otpReceived = value;
    notifyListeners();
  }

  passwordVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }

  // confirm password  validation
  confirmPasswordValidation(String value) {
    if (value.isEmpty) {
      return "Enter your password";
    } else if (confirmPasswordController.text != newPasswordController.text) {
      return "Password doesn't matched";
    }
  }

  clearTextField() {
    signInEmailController.clear();
    signInPasswordController.clear();
    signUpNameController.clear();
    signUpEmailController.clear();
    signUpPasswordController.clear();
    notifyListeners();
  }

//=================================================================================
// Api Calling

  // sign up
  Future<void> signUp(
    String screen,
  ) async {
    // Check for internet connection
    //Getting firebase fcm token
    String? fcmToken =
        await FirebaseRepo.getFcmToken(Navigator.of(context!), screen);
    debugPrint("fcm_token ==========================>>> $fcmToken");

    if (fcmToken != null) {
      // Store token in Shared preferences to get if required after
      LocalDb.storeFcmToken(fcmToken);

      // ignore: use_build_context_synchronously
      setLoading(true);

      try {
        // To call repository api methods and then store in response
        final response = await apiRepo
            .postRequest(Navigator.of(context!), screen, ApiUrl.signUpUrl, {
          "name": signUpNameController.text,
          "email": signUpEmailController.text,
          "password": signUpPasswordController.text,
          "fcm_token": fcmToken
        });
        final responseBody = response.data;
        debugPrint("response body ===============>>> $responseBody");

        // Assign and parse api response data in model class
        signupModel = SignupModel.fromJson(responseBody);

        // If response have no error
        if (signupModel.error == false) {
          // Set user id in shared preferences
          LocalDb.storeUserId(signupModel.data!.id!);

          // Set user email in shared preferences
          LocalDb.storeUserEmail(signupModel.data!.email!);

          // Set bearer in shared preferences
          LocalDb.storeBearerToken(signupModel.data!.token!);

          // Set login state in shared preferences
          LocalDb.storeLogin(true);

          clearTextField();
        } else {
          showToast(
              context: context!,
              msg: signupModel.message.toString(),
              isError: true);
        }

        setLoading(false);
      } catch (e) {
        setLoading(false);
      }

      notifyListeners();
    }
  }

  // Sign in
  Future<void> signIn(
    String screen,
  ) async {
    // Check for internet connection
    //Getting firebase fcm token
    String? fcmToken =
        await FirebaseRepo.getFcmToken(Navigator.of(context!), screen);
    debugPrint("fcm_token ==========================>>> $fcmToken");

    if (fcmToken != null) {
      // Store token in Shared preferences to get if required after
      LocalDb.storeFcmToken(fcmToken);

      setLoading(true);

      try {
        // To call repository api methods and then store in response
        final response = await apiRepo
            .postRequest(Navigator.of(context!), screen, ApiUrl.loginInUrl, {
          "email": signInEmailController.text,
          "password": signInPasswordController.text,
          "fcm_token": fcmToken
        });
        final responseBody = response.data;
        debugPrint("response body ===============>>> $responseBody");

        // Assign and parse api response data in model class
        signupModel = SignupModel.fromJson(responseBody);

        // If response have no error
        if (signupModel.error == false) {
          // Set user id in shared preferences
          LocalDb.storeUserId(signupModel.data!.id!);

          // Set user email in shared preferences
          LocalDb.storeUserEmail(signupModel.data!.email!);

          // Set bearer in shared preferences
          LocalDb.storeBearerToken(signupModel.data!.token!);

          // Set login state in shared preferences
          LocalDb.storeLogin(true);

          clearTextField();
        } else {
          showToast(
              context: context!,
              msg: signupModel.message.toString(),
              isError: true);
        }

        setLoading(false);
      } catch (e) {
        setLoading(false);
      }

      notifyListeners();
    }
  }

  //SOCIAL SIGNUP
  socialSignup(String name, String screen) async {
    //Getting firebase fcm token
    String? fcmToken =
        await FirebaseRepo.getFcmToken(Navigator.of(context!), screen);
    debugPrint("fcm_token ==========================>>> $fcmToken");

    // checking for fcm token
    if (fcmToken != null) {
      // Store token in Shared preferences to get if required after
      LocalDb.storeFcmToken(fcmToken);

      //calling methods of social login to Get Social login data
      Map<String, dynamic>? data = await getSocialData(name, fcmToken);

      if (data["name"] == null && data["email"] == null ||
          data["name"] == "null" && data["email"] == "null") {
        showToast(
            context: context!,
            msg:
                "Please Allow name and email which is Mandatory for social login",
            isError: true);
      }

      try {
        setLoading(true);

        // ignore: use_build_context_synchronously
        final response = await apiRepo.postRequest(
            Navigator.of(context!), screen, ApiUrl.socialLoginUrl, data);
        final responseBody = response.data;
        debugPrint("response body ===============>>> $responseBody");
        signupModel = SignupModel.fromJson(responseBody);

        // If response have no error
        if (signupModel.error == false) {
          // Set user id in shared preferences
          LocalDb.storeUserId(signupModel.data!.id!);

          // Set user email in shared preferences
          LocalDb.storeUserEmail(signupModel.data!.email!);

          // Set bearer in shared preferences
          LocalDb.storeBearerToken(signupModel.data!.token!);

          // Set login state in shared preferences
          LocalDb.storeLogin(true);

          clearTextField();
        } else {
          showToast(
              context: context!,
              msg: signupModel.message.toString(),
              isError: true);
        }

        setLoading(false);
      } catch (e) {
        setLoading(false);
      }

      notifyListeners();
    }
  }

//===============================================================================
// social signIn

  // instance of the firebase authentication
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<Map<String, dynamic>> getSocialData(String name, String token) async {
    Map<String, dynamic>? data;
    // if user call for google signIn
    if (name == "google") {
      GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      // sending data to api
      data = {
        "name": "${googleUser!.displayName}",
        "email": googleUser.email,
        "social_media_token": googleUser.id,
        "social_media_platform": "google",
        "fcm_token": token,
      };
    } else if (name == "facebook") {
      await FacebookAuth.instance
          .login(permissions: ["public_profile", "email"]).then((value) async {
        await FacebookAuth.instance.getUserData().then((newData) {
          data = {
            "name": "${newData["name"]}",
            "email": "${newData["email"]}",
            "social_media_token": "${newData["id"]}",
            "social_media_platform": "facebook",
            "fcm_token": token,
          };
        });
      });
    }

    // if user call for Apple signIn
    else if (name == "apple") {
      // We will user redirect url and client id,  if the device is android
      // We are generating url from glitch website, for more detail see the sign_in_with_apple package documents
      var redirectURL =
          "https://robust-giant-grenadilla.glitch.me/callbacks/sign_in_with_apple";
      var clientID = "com.OogleMate.appservices";

      final appleIdCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
            clientId: clientID, redirectUri: Uri.parse(redirectURL)),
      );
      final oAuthProvider = OAuthProvider('apple.com');
      final credential = oAuthProvider.credential(
        idToken: appleIdCredential.identityToken,
        accessToken: appleIdCredential.authorizationCode,
      );
      // sending data to api
      data = {
        "name":
            "${appleIdCredential.givenName} ${appleIdCredential.familyName}",
        "email": appleIdCredential.email.toString() == 'null'
            ? null
            : appleIdCredential.email.toString(),
        "social_media_token": "${appleIdCredential.identityToken}",
        "social_media_platform": "apple",
        "fcm_token": token,
        "os_type": Platform.isAndroid ? "android" : "ios",
      };

      debugPrint("data is : $data");
    }

    return data!;
  }
}
