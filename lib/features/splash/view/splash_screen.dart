import 'package:get/get.dart';
import 'package:getx_boiler_plate/constants/assets_constants.dart';
import 'package:getx_boiler_plate/features/splash/controller/splash_controller.dart';
import 'package:getx_boiler_plate/features/widgets/custom_image_view.dart';
import 'package:getx_boiler_plate/utils/size_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 1.v),
              CustomImageView(
                imagePath: appLogo,
                height: 325.v,
                width: 238.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
