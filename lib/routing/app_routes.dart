import 'package:get/get.dart';
import 'package:getx_boiler_plate/features/authentication/login/binding/login_binding.dart';
import 'package:getx_boiler_plate/features/authentication/login/view/login_screen.dart';
import 'package:getx_boiler_plate/features/authentication/login_or_signup_screen/view/login_or_signup_screen.dart';
import 'package:getx_boiler_plate/features/landing_page/binding/landing_page_binding.dart';
import 'package:getx_boiler_plate/features/landing_page/view/landing_page_screen.dart';
import 'package:getx_boiler_plate/features/splash/binding/splash_binding.dart';
import 'package:getx_boiler_plate/features/splash/view/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginOrSignupScreen = '/login_or_signup_screen';

  static const String loginScreen = '/login_screen';

  static String landingPageScreen = '/landing_page';


  static List<GetPage> pages =[
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: loginOrSignupScreen,
      page: () => const LoginOrSignupScreen(),
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.landingPageScreen,
      page: () => const LandingPageScreen(),
      binding: LandingPageBinding(),
    ),
  ];
}
