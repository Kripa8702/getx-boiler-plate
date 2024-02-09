import 'package:get/get.dart';
import 'package:getx_boiler_plate/features/landing_page/controller/landing_page_controller.dart';

class LandingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingPageController>(() => LandingPageController());
  }
}