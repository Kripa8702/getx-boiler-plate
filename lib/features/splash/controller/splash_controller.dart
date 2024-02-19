import 'package:get/get.dart';
import 'package:getx_boiler_plate/features/authentication/repository/auth_repository.dart';
import 'package:getx_boiler_plate/routing/app_routes.dart';
import 'package:getx_boiler_plate/utils/navigator_service.dart';

class SplashController extends GetxController {
  final authRepository = Get.find<AuthRepository>();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (authRepository.isSignedIn) {
        NavigatorService.pushReplacementNamed(
          AppRoutes.landingPageScreen,
        );
      } else {
        NavigatorService.pushReplacementNamed(
          AppRoutes.loginOrSignupScreen,
        );
      }
    });
  }
}
