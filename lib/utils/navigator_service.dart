import 'package:get/get.dart';

class NavigatorService {
  static void pushNamed(String routeName, {Object? arguments}) {
    Get.toNamed(routeName, arguments: arguments);
  }

  static void pushReplacementNamed(String routeName, {Object? arguments}) {
    Get.offAllNamed(routeName, arguments: arguments);
  }

  static void pop() {
    Get.back();
  }
}
