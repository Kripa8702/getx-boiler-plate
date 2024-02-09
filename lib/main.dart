import 'package:getx_boiler_plate/config/flavour_config.dart';
import 'package:getx_boiler_plate/getx_boilerplate_app.dart';
import 'package:getx_boiler_plate/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

//Specify the environment
const Env env = Env.dev;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final config = FlavorConfig(
    appName: appNames[env] ?? "Development",
    apiBaseUrl: apiBaseUrls[env] ?? "https://dummyjson.com", // Replace with your Development API URL
    env: env,
  );
  ///Uncomment this code if you are using Firebase
  // await Firebase.initializeApp(
  //   name: 'SecondaryApp',
  //   options: FirebaseConfig().firebaseConfig,
  // );


  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init(),
  ]).then(
    (value) {
      runApp(
        GetxBoilerPlateApp(
          flavorConfig: config,
        ),
      );
    },
  );
}
