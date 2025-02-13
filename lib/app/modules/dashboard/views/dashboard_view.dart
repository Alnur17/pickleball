import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pickleball/app/modules/home/views/home_view.dart';
import 'package:pickleball/common/app_color/app_colors.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  DashboardView({super.key}); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () {
            return IndexedStack(
              index: dashboardController.selectedIndex.value,
              children: [
                HomeView(),
                Container(),
                Container(),
                Container(),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return GNav(
            backgroundColor: Colors.white,
            color: Colors.blueGrey,
            activeColor: Colors.white,
            iconSize: 24,
            gap: 8,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            onTabChange: dashboardController.onItemTapped,
            selectedIndex: dashboardController.selectedIndex.value,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                iconColor: Colors.blue,
                backgroundColor: AppColors.textColorBlue,
              ),
              GButton(
                icon: Icons.menu,
                text: 'Menu',
                iconColor: Colors.blue,
                backgroundColor: AppColors.textColorBlue,
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
                iconColor: Colors.blue,
                backgroundColor: AppColors.textColorBlue,
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                iconColor: Colors.blue,
                backgroundColor: AppColors.textColorBlue,
              ),
            ],
          );
        }),
      ),
    );
  }
}
