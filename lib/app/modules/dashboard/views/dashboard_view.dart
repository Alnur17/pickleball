import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pickleball/app/modules/booking/views/booking_view.dart';
import 'package:pickleball/app/modules/home/views/home_view.dart';
import 'package:pickleball/app/modules/my_search/views/my_search_view.dart';
import 'package:pickleball/app/modules/profile_and_settings/views/profile_and_settings_view.dart';
import 'package:pickleball/common/app_color/app_colors.dart';
import 'package:pickleball/common/app_images/app_images.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Obx(() {
                  return IndexedStack(
                    index: dashboardController.selectedIndex.value,
                    children: [
                      HomeView(),
                      MySearchView(),
                      BookingView(),
                      ProfileAndSettingsView(),
                    ],
                  );
                }),
              ),
            ],
          ),

          // Positioned bottom navigation bar
          Positioned(
            bottom: 16,
            left: 20,
            right: 20,
            child: Obx(() {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: AppColors.borderColor),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: GNav(
                  backgroundColor: AppColors.transparent,
                  activeColor: Colors.white,
                  gap: 0,
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                  onTabChange: dashboardController.onItemTapped,
                  selectedIndex: dashboardController.selectedIndex.value,
                  tabs: [
                    GButton(
                      icon: Icons.circle,
                      leading: dashboardController.selectedIndex.value == 0
                          ? SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                AppImages.home,
                                scale: 4,
                                color: AppColors.white,
                              ),
                            )
                          : SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                AppImages.home,
                                fit: BoxFit.cover,
                                scale: 4,
                              ),
                            ),
                      text: 'Home',
                      backgroundColor: AppColors.textColorBlue,
                    ),
                    GButton(
                      icon: Icons.circle,
                      leading: dashboardController.selectedIndex.value == 1
                          ? SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                AppImages.search,
                                scale: 4,
                                color: AppColors.white,
                              ),
                            )
                          : SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                AppImages.search,
                                fit: BoxFit.cover,
                                scale: 4,
                              ),
                            ),
                      text: 'Search',
                      iconColor: Colors.blue,
                      backgroundColor: AppColors.textColorBlue,
                    ),
                    GButton(
                      icon: Icons.circle,
                      leading: dashboardController.selectedIndex.value == 2
                          ? SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          AppImages.booking,
                          scale: 4,
                          color: AppColors.white,
                        ),
                      )
                          : SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          AppImages.booking,
                          fit: BoxFit.cover,
                          scale: 4,
                        ),
                      ),
                      text: 'Booking',
                      iconColor: Colors.blue,
                      backgroundColor: AppColors.textColorBlue,
                    ),
                    GButton(
                      leading: dashboardController.selectedIndex.value == 3
                          ? SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                AppImages.profile,
                                scale: 4,
                                color: AppColors.white,
                              ),
                            )
                          : SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                AppImages.profile,
                                fit: BoxFit.cover,
                                scale: 4,
                              ),
                            ),
                      text: 'Profile &\nSettings',
                      iconColor: Colors.blue,
                      backgroundColor: AppColors.textColorBlue,
                      icon: Icons.circle,
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
