import 'package:get/get.dart';
import 'package:getx_boiler_plate/features/authentication/login/controller/login_controller.dart';

class LoginBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}