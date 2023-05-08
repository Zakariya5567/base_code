import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';

loaderDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
            backgroundColor: whitePrimary,
            insetPadding: const EdgeInsets.all(100),
            contentPadding: const EdgeInsets.all(25),
            clipBehavior: Clip.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: SizedBox(
                height: 80.h,
                width: 80.h,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: bluePrimary,
                  ),
                )));
      });
}
