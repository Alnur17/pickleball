import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/app/modules/home/controllers/home_controller.dart';
import 'package:pickleball/app/modules/my_search/views/session_details_view.dart';
import 'package:pickleball/app/modules/my_search/views/trainer_profile_view.dart';
import 'package:pickleball/common/app_images/app_images.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/widgets/search_filed.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/helper_widget/course_card_widget.dart';
import '../../../../common/helper_widget/profile_card_widget.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../controllers/my_search_controller.dart';

class MySearchView extends GetView<MySearchController> {
  final int tabIndex;
  final bool showBackButton;

  MySearchView({
    super.key,
    this.tabIndex = 0,
    this.showBackButton = false,
  });

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: tabIndex,
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: showBackButton,
          leading: showBackButton
              ? GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 4),
                    child: Image.asset(
                      AppImages.back,
                      scale: 4,
                    ),
                  ),
                )
              : null,
          titleSpacing: 20,
          title: Text('Search', style: appBarStyle),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Sessions'),
                Tab(text: 'Trainers'),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.lightGreen,
              labelColor: Colors.lightGreen,
              unselectedLabelColor: AppColors.black,
              dividerColor: AppColors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 80),
            ),
            sh16,
            Expanded(
              child: TabBarView(
                children: [
                  _buildSessionsTab(),
                  _buildTrainersTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionsTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          //_buildSearchBar(),
          Row(
            children: [
              Expanded(
                child: SearchFiled(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      homeController.fetchCourseSessions(
                          null); // Fetch all course sessions
                      //homeController.fetchTrainers(null);  // Fetch all trainers
                    } else {
                      // Trigger search filtering dynamically
                      homeController.onSearchQueryChangedSession(value);
                    }
                  },
                ),
              ),
              sw12,
              Container(
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.silver),
                ),
                child: Image.asset(
                  AppImages.filter,
                  scale: 4,
                ),
              ),
            ],
          ),
          sh20,
          Expanded(
            child: ListView.builder(
              itemCount: homeController.courseSessions.length,
              itemBuilder: (context, index) {
                var session = homeController.courseSessions[index];
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == homeController.courseSessions.length - 1
                        ? 116
                        : 12,
                  ),
                  child: CourseCardWidget(
                    title: session.name ?? "No title",
                    description: session.description ?? "No description",
                    date: "No date",
                    startTime: session.startTime ?? "No start time",
                    endTime: session.endTime ?? "No end time",
                    location: session.location ?? "No location",
                    skillLevel: session.skillLevel ?? "No skill level",
                    price: session.price ?? 0,
                    onViewDetails: () {
                      Get.to(() => SessionDetailsView(id: session.id,));
                      debugPrint('::::::::::: ${session.id} ::::::::::::');
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTrainersTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          //_buildSearchBar(),
          Row(
            children: [
              Expanded(
                child: SearchFiled(
                  onChanged: (value) {
                    if (value.isEmpty) {
                      //homeController.fetchCourseSessions(null);  // Fetch all course sessions
                      homeController.fetchTrainers(null); // Fetch all trainers
                    } else {
                      // Trigger search filtering dynamically
                      homeController.onSearchQueryChangedTrainer(value);
                    }
                  },
                ),
              ),
              sw12,
              Container(
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.silver),
                ),
                child: Image.asset(
                  AppImages.filter,
                  scale: 4,
                ),
              ),
            ],
          ),
          sh20,
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(bottom: 116),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemCount: homeController.trainerList.length,
              itemBuilder: (context, index) {
                var trainer = homeController.trainerList[index];
                return ProfileCardWidget(
                  name: trainer.user?.name ?? 'Unknown',
                  rating: trainer.avgRating ?? 0.0,
                  experience: (trainer.experience ?? 0).toString(),
                  hourlyRate: (trainer.perHourRate ?? 0).toString(),
                  profileImage:
                      trainer.user?.photoUrl ?? AppImages.profileImageTwo,
                  onTap: () {
                    Get.to(() => TrainerProfileView());
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  // Widget _buildSearchBar() {
  //   return Row(
  //     children: [
  //       Expanded(
  //         child: SearchFiled(
  //           onChanged: (value) {
  //             if (value.isEmpty) {
  //               homeController
  //                   .fetchCourseSessions(null); // Fetch all course sessions
  //               homeController.fetchTrainers(null); // Fetch all trainers
  //             } else {
  //               // Trigger search filtering dynamically
  //              // homeController.onSearchQueryChanged(value);
  //             }
  //           },
  //         ),
  //       ),
  //       sw12,
  //       Container(
  //         height: 48,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(12),
  //           border: Border.all(color: AppColors.silver),
  //         ),
  //         child: Image.asset(
  //           AppImages.filter,
  //           scale: 4,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
