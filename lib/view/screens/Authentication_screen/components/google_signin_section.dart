import 'package:base_code/view/widgets/extention/int_extension.dart';
import 'package:base_code/view/widgets/extention/string_extension.dart';
import 'package:base_code/view/widgets/extention/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/string.dart';
import '../../../../utils/style.dart';
import '../../../widgets/button_with_icon.dart';

class GoogleSignInSection extends StatelessWidget {
  const GoogleSignInSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: whitePrimary,
                height: 1,
                width: 130.w,
              ),
              or
                  .toText(
                      fontSize: 18, color: pinkLight, fontFamily: sofiaRegular)
                  .align(Alignment.topCenter)
                  .paddingSymmetric(horizontal: 10.w),
              Container(
                color: whitePrimary,
                height: 1,
                width: 130.w,
              ),
            ],
          ).paddingSymmetric(horizontal: 5.w),
        ),
        25.height,
        ButtonWithIcon(
          buttonName: btnSignInWithGoogle,
          icon: Images.iconGoogle,
          onPressed: () {},
          buttonColor: whitePrimary,
          borderColor: whitePrimary,
          buttonTextColor: blackPrimary,
        ),
      ],
    );
  }
}
