import 'package:provider/provider.dart';

import '../provider/alert_provider.dart';
import '../provider/authentication_provider.dart';
import '../provider/bottom_navigation_provider.dart';
import '../provider/home_provider.dart';
import '../provider/profile_provider.dart';
import '../provider/setting_provider.dart';
import '../provider/setup_provider.dart';

class ProviderHelper {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
    ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
    ChangeNotifierProvider<AlertProvider>(create: (context) => AlertProvider()),
    ChangeNotifierProvider<SettingProvider>(
        create: (context) => SettingProvider()),
    ChangeNotifierProvider<SetupProvider>(create: (context) => SetupProvider()),
    ChangeNotifierProvider<ProfileProvider>(
        create: (context) => ProfileProvider()),
    ChangeNotifierProvider<BottomNavigationProvider>(
        create: (context) => BottomNavigationProvider()),
  ];
}
