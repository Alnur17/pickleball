import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> _screens = [
    const HomeView(),
     Container(),
     Container(),
     Container(),
  ];

  Widget get currentScreen => _screens[selectedIndex.value];

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
