import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  bool isNotify = false;

  setNotify() {
    isNotify = !isNotify;
    notifyListeners();
  }
}
