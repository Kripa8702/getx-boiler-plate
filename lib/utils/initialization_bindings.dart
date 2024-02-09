import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_boiler_plate/config/flavour_config.dart';
import 'package:getx_boiler_plate/features/authentication/repository/auth_repository.dart';
import 'package:getx_boiler_plate/utils/dio_client.dart';

class InitializationBindings extends Bindings {
  final FlavorConfig apiConfig;

  InitializationBindings({required this.apiConfig});

  @override
  void dependencies() {
    log("::::::::::::::::::::: InitializationBindings :::::::::::::::::::::");

    Get.put(DioClient(flavorConfig: apiConfig));
    Get.put(AuthRepository(dioClient: Get.find<DioClient>()));



  }
}
