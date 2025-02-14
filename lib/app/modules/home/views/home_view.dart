import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/common/app_color/app_colors.dart';
import 'package:pickleball/common/app_images/app_images.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/helper_widget/course_card_widget.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';
import 'package:pickleball/common/helper_widget/header_section_widget.dart';
import 'package:pickleball/common/helper_widget/profile_card_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            sw5,
            Container(
                height: 42,
                width: 42,
                //padding: EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      AppImages.profileImageTwo,
                      scale: 4,
                      fit: BoxFit.cover,
                    ))),
            sw12,
            Text(
              'Hey Sunan',
              style: appBarStyle,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                AppImages.notification,
                scale: 4,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh20,
            _buildHeader(),
            _buildRecommendationSection(),
            _buildExpertSection(),
            sh116,
          ],
        ),
      ),
    );
  }
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
          onTap: () {},
        ),
      ),
      SizedBox(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 20 : 0,
                right: index == 5 - 1 ? 20 : 8,
              ),
              child: CourseCardWidget(
                title: "Doubles Strategy Masterclass",
                description: "Master the art of playing doubles in this comprehensive session designed for intermediate to advanced Pickleball players...",
                date: "25 January 2025",
                time: "2:00 PM - 3:00 PM",
                location: "Sunset Pickleball Club, Miami Beach",
                skillLevel: "Beginner",
                price: "25",
                onViewDetails: () {
                  // Handle button tap
                  print("View Details Clicked");
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
          onTap: () {},
        ),
      ),
      SizedBox(
        height: 190,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 20 : 0,
                right: index == 5 - 1 ? 20 : 8,
              ),
              child: ProfileCardWidget(
                name: 'John Smith',
                rating: 4.5,
                experience: '10+ Years',
                hourlyRate: '50/hour',
                profileImage: AppImages.profileImageTwo,
                onTap: () {},
              ),
            );
          },
        ),
      ),
    ],
  );
}
