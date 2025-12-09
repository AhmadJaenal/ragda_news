import 'package:get/get.dart';

import '../features/authentication/screens/login_screen.dart';
import '../features/dashboard/news/ui/news_screen.dart';
import '../features/dashboard/screens/dashboard_screen.dart';
import '../features/dashboard/screens/navbar.dart';
import '../features/dashboard/screens/profile_screen.dart';
import '../features/onboard/screen/splash_screen.dart';
import 'routes.dart';

class AppPages {
  static const initial = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.news,
      page: () => const NewsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.navbar,
      page: () => const NavBarBottom(),
      transition: Transition.fadeIn,
    ),
  ];
}
