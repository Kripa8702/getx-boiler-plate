import 'package:bloc_boiler_plate/constants/array_constants.dart';
import 'package:flutter/material.dart';



class BottomNavigationScreen extends StatelessWidget {
  final int tabIndex;
  final Function(int) onTabChange;
  const BottomNavigationScreen({super.key, required this.tabIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomNavItems,
      currentIndex: tabIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.grey,
      onTap: onTabChange,
    );
  }
}
