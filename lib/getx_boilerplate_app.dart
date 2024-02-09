import 'package:get/get.dart';
import 'package:getx_boiler_plate/config/flavour_config.dart';
import 'package:getx_boiler_plate/localizations/app_localization.dart';
import 'package:getx_boiler_plate/routing/app_routes.dart';
import 'package:getx_boiler_plate/theme/app_styles.dart';
import 'package:getx_boiler_plate/theme/colors.dart';
import 'package:getx_boiler_plate/utils/initialization_bindings.dart';
import 'package:getx_boiler_plate/utils/navigator_service.dart';
import 'package:getx_boiler_plate/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class GetxBoilerPlateApp extends StatelessWidget {
  final FlavorConfig flavorConfig;

  const GetxBoilerPlateApp({Key? key, required this.flavorConfig})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            title: 'getx Architecture Demo',
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigatorService.navigatorKey,
            locale: const Locale('en', ''),
            localizationsDelegates: const [
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              fontFamily: 'Poppins',
              colorScheme: const ColorScheme.light(
                primary: primaryColor,
                secondary: secondaryColor,
                background: Colors.white,
              ),
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme(
                bodyLarge: CustomTextStyles.bodyLarge,
                bodyMedium: CustomTextStyles.bodyMedium,
                bodySmall: CustomTextStyles.bodySmall,
                displaySmall: CustomTextStyles.displaySmall,
                headlineMedium: CustomTextStyles.headlineMedium,
                labelLarge: CustomTextStyles.labelLarge,
                titleLarge: CustomTextStyles.titleLarge,
                titleMedium: CustomTextStyles.titleMedium,
                titleSmall: CustomTextStyles.titleSmall,
              ),
            ),
            initialBinding: InitializationBindings(apiConfig: flavorConfig),
            initialRoute: AppRoutes.splashScreen,
            getPages: AppRoutes.pages,
          ),
        );
      },
    );
  }
}
