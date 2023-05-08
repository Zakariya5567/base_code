import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  static String bearerTokenKey = "BearerToken";
  static String isLoginKey = "isLogin";
  static String userEmailKey = "userEmail";
  static String userIdKey = "userId";
  static String fcmTokenKey = "fcmToken";

  //=============================================================================
  // Set bearer token
  static Future<void> storeBearerToken(String value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store bearer token in shared preferences
    sharedPreferences.setString(bearerTokenKey, value);
  }

  // Get bearer token
  static Future<String?> get getBearerToken async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = sharedPreferences.getString(bearerTokenKey);
    return bearerToken;
  }

  //=============================================================================
  // Set bearer token
  static Future<void> storeFcmToken(String value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store fcm token in shared preferences
    sharedPreferences.setString(fcmTokenKey, value);
  }

  // Get bearer token
  static Future<String?> get getFcmToken async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the fcm token which we have stored in sharedPreferences before
    String? fcmToken = sharedPreferences.getString(fcmTokenKey);
    return fcmToken;
  }

  //=============================================================================
  // Set user is Login
  static Future<void> storeLogin(bool value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store bearer token in shared preferences
    sharedPreferences.setBool(isLoginKey, value);
  }

  // Get user login Status
  static Future<bool?> get getLogin async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the bearer token which we have stored in sharedPreferences before
    bool? isLogin = sharedPreferences.getBool(isLoginKey);
    return isLogin;
  }

  //=============================================================================
  // Store email of user
  static Future<void> storeUserEmail(String value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store bearer token in shared preferences
    sharedPreferences.setString(userEmailKey, value);
  }

  // Get user email
  static Future<String?> get getUserEmail async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the bearer token which we have stored in sharedPreferences before
    String? userEmail = sharedPreferences.getString(userEmailKey);
    return userEmail;
  }

  //=============================================================================
  // Store Id of user
  static Future<void> storeUserId(int value) async {
    // initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Store bearer token in shared preferences
    sharedPreferences.setInt(userIdKey, value);
  }

  // Get user id
  static Future<int?> get getUserId async {
    // Initialized shared preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // Get the bearer token which we have stored in sharedPreferences before
    int? userId = sharedPreferences.getInt(userIdKey);
    return userId;
  }
}
