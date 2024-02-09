import 'package:get/get.dart';
import 'package:getx_boiler_plate/features/bottom_navigation_bar/view/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:getx_boiler_plate/features/landing_page/controller/landing_page_controller.dart';

const List<Widget> bottomNavScreen = <Widget>[
  Text('Home'),
  Text('Category'),
  Text('Search'),
  Text('Favourite'),
  Text('Cart'),
];

class LandingPageScreen extends GetWidget<LandingPageController> {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Center(
          child: bottomNavScreen.elementAt(controller.tabIndex.value),
        ),
        bottomNavigationBar: BottomNavigationScreen(
          tabIndex: controller.tabIndex.value,
          onTabChange: (index) {
            controller.tabIndex.value = index;
          },
        ),
      );
    });
  }
}
