import 'package:flutter/material.dart';

import '../data/model/authentication/signup_model.dart';
import '../data/repository/api_repo.dart';
import '../utils/api_url.dart';
import '../view/widgets/loader_dialog.dart';

class SetupProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressLine1Controller = TextEditingController();
  TextEditingController addressLine2Controller = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController wifiNameController = TextEditingController();
  TextEditingController wifiPasswordController = TextEditingController();
  TextEditingController nameYourDeviceController = TextEditingController();

  bool isVisible = false;
  passwordVisibility() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
