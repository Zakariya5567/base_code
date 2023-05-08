import 'package:base_code/utils/string.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../helper/routes_helper.dart';
import '../../provider/bottom_navigation_provider.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

// =============================================================================

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  // Bottom navigation the the bottom navigation bar of the app

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
        builder: (context, controller, child) {
      return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          selectedItemColor: bluePrimary,
          unselectedItemColor: greyPrimary,
          backgroundColor: whitePrimary,
          elevation: 5,
          currentIndex: controller.currentIndex,
          onTap: (index) {
            // set the current index of the bottom navigation bar
            // the function is declared inside BottomNavigationProvider

            controller.setCurrentIndex(index);

            switch (index) {
              case 0:
                // Navigator.of(context).pushNamed(
                //   RouterHelper.alertScreen,
                // );
                break;
              case 1:
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //     RouterHelper.homeScreen, (route) => false);
                break;
              case 2:
                // Navigator.of(context).pushNamed(
                //   RouterHelper.settingScreen,
                // );
                break;
            }
          },
          items: const <BottomNavigationBarItem>[
            // ALERT
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Images.iconAlert)), label: alert),
            // HOME
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(Images.iconHome)), label: home),
            // SETTING
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(Images.iconSetting),
                ),
                label: setting),
          ]);
    });
  }
}
