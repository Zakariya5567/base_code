import 'package:base_code/utils/colors.dart';
import 'package:base_code/utils/style.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';

import 'extention/border_extension.dart';

void showToast(
        {required BuildContext context,
        required String msg,
        required bool isError}) async =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        dismissDirection: DismissDirection.up,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        content: Container(
            decoration: BoxDecoration(
                color: isError == true ? Colors.red : Colors.green,
                borderRadius: borderRadiusCircular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(-4, 4),
                  ),
                ]),
            child: msg
                .toText(
                    color: whitePrimary,
                    fontSize: 14,
                    fontFamily: sofiaRegular,
                    overflow: TextOverflow.visible)
                .center
                .paddingSymmetric(horizontal: 10, vertical: 20)),
      ),
    );
