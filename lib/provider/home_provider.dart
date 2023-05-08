import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  //Search controller
  TextEditingController searchController = TextEditingController();

  //Search controller
  TextEditingController deviceNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController locationController = TextEditingController();
}
