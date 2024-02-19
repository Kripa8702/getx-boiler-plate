import 'package:getx_boiler_plate/features/authentication/repository/auth_repository.dart';
import 'package:getx_boiler_plate/routing/app_routes.dart';
import 'package:getx_boiler_plate/utils/navigator_service.dart';
import 'package:getx_boiler_plate/utils/pref_utils.dart';
import 'package:getx_boiler_plate/utils/toast_utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginController extends GetxController {
  Rx<LoginStatus> status = Rx<LoginStatus>(LoginStatus.initial);

  final onSubmit = false.obs;
  final AuthRepository authRepo = Get.find<AuthRepository>();
  final PrefUtils prefUtils = PrefUtils();

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> login(String email, String password) async {
    try {
      status.value = LoginStatus.loading;

      final user = await authRepo.signIn(email, password);
      Get.put(user);

      prefUtils.setString(key: "token", value: user.token);
      prefUtils.setBool("isLoggedIn", true);

      status.value = LoginStatus.success;

      NavigatorService.pushReplacementNamed(
        AppRoutes.landingPageScreen,
      );
    } on DioException catch (e) {
      ToastUtils.showToast(e.response?.data["message"]);
      status.value = LoginStatus.failure;
    }
  }
}
