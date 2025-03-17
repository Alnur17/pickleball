import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/app/modules/home/views/notification_view.dart';
import 'package:pickleball/app/modules/my_search/views/my_search_view.dart';
import 'package:pickleball/app/modules/my_search/views/trainer_profile_view.dart';
import 'package:pickleball/app/modules/profile_and_settings/controllers/profile_and_settings_controller.dart';
import 'package:pickleball/common/app_color/app_colors.dart';
import 'package:pickleball/common/app_images/app_images.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/helper_widget/course_card_widget.dart';
import 'package:pickleball/common/helper_widget/date_time_formation_class.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';
import 'package:pickleball/common/helper_widget/header_section_widget.dart';
import 'package:pickleball/common/helper_widget/profile_card_widget.dart';

import '../../my_search/views/session_details_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final ProfileAndSettingsController profileAndSettingsController =
      Get.put(ProfileAndSettingsController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        titleSpacing: 20,
        title: Obx(
          () {
            return Row(
              children: [
                Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      profileAndSettingsController
                              .myProfileData.value?.photoUrl ??
                          AppImages.profileImageCamera,
                      scale: 4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                sw12,
                Text(
                  profileAndSettingsController.myProfileData.value?.name ??
                      'Unknown',
                  style: appBarStyle,
                ),
              ],
            );
          },
        ),
        automaticallyImplyLeading: false,
        actions: [
          // GestureDetector(
          //   onTap: () {
          //     Get.to(()=> SubscriptionView());
          //   },
          //   child: Image.asset(
          //     AppImages.subscriptionButton,
          //     scale: 4,
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              Get.to(() => NotificationView());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                AppImages.notification,
                scale: 4,
              ),
            ),
          )
        ],
      ),
      body: Obx(
        () {
          if (homeController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (homeController.courseSessions.isEmpty &&
              homeController.trainerList.isEmpty) {
            return Center(child: Text("No data available"));
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  sh16,
                  _buildHeader(),
                  _buildRecommendationSection(),
                  _buildExpertSection(),
                  sh116,
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 30),
        decoration: BoxDecoration(
          color: AppColors.textColorBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Technologies",
              style: h2.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            sh5,
            Text(
              "+ Over 14k products",
              style: h5.copyWith(color: AppColors.whiteDark),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: HeaderSectionWidget(
            title: 'Recommended for You',
            actionText: 'See more..',
            actionIcon: AppImages.arrowRight,
            onTap: () {
              Get.to(() => MySearchView(
                    tabIndex: 0,
                    showBackButton: true,
                  ));
            },
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeController.courseSessions.length,
            itemBuilder: (context, index) {
              var session = homeController.courseSessions[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == homeController.courseSessions.length*0 ? 20 : 0,
                  right: index == homeController.courseSessions.length - 1
                      ? 20
                      : 12,
                ),
                child: CourseCardWidget(
                  title: session.name ?? "No title",
                  description: session.description ?? "No description",
                  date: DateTimeFormationClass.formatDate(session.createdAt.toString()),
                  startTime: session.startTime ?? "No start time",
                  endTime: session.endTime ?? "No end time",
                  location: session.location ?? "No location",
                  skillLevel: session.skillLevel ?? "No skill level",
                  price: session.price ?? 0,
                  onViewDetails: () {
                    Get.to(() => SessionDetailsView(id: session.id,));
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }



  Widget _buildExpertSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: HeaderSectionWidget(
            title: 'Recommended for You',
            actionText: 'See more..',
            actionIcon: AppImages.arrowRight,
            onTap: () {
              Get.to(() => MySearchView(
                    tabIndex: 1,
                    showBackButton: true,
                  ));
            },
          ),
        ),
        SizedBox(
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeController.trainerList.length,
            itemBuilder: (context, index) {
              var trainer = homeController.trainerList[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == homeController.courseSessions.length * 0 ? 20 : 0,
                  right:
                      index == homeController.trainerList.length - 1 ? 20 : 12,
                ),
                child: ProfileCardWidget(
                  name: trainer.user?.name ?? 'Unknown',
                  rating: trainer.avgRating ?? 0.0,
                  experience: (trainer.experience ?? 0).toString(),
                  hourlyRate: (trainer.perHourRate ?? 0).toString(),
                  profileImage:
                      trainer.user?.photoUrl ?? AppImages.profileImageTwo,
                  onTap: () {
                    Get.to(() => TrainerProfileView(id: trainer.id,));
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
