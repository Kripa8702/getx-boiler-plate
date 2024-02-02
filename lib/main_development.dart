import 'package:bloc_boiler_plate/config/flavour_config.dart';
import 'package:bloc_boiler_plate/constants/enum_constants.dart';
import 'package:bloc_boiler_plate/features/widgets/bloc_boilerplate_app.dart';
import 'package:bloc_boiler_plate/simple_bloc_observer.dart';
import 'package:bloc_boiler_plate/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

const Environment environment = Environment.development;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final config = FlavorConfig(
    appName: "Development App",
    apiBaseUrl: "https://dummyjson.com", // Replace with your Development API URL
    env: Env.dev,
  );
  ///Uncomment this code if you are using Firebase
  // await Firebase.initializeApp(
  //   name: 'SecondaryApp',
  //   options: FirebaseConfig().firebaseConfig,
  // );


  Bloc.observer = const SimpleBlocObserver();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init(),
  ]).then(
    (value) {
      runApp(
        BlocBoilerPlateApp(
          flavorConfig: config,
        ),
      );
    },
  );
}
