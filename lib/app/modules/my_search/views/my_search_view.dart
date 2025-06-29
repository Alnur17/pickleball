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
import '../../../../common/helper_widget/date_time_formation_class.dart';
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
          SearchFiled(
            onChanged: (value) {
              homeController.onSearchQueryChangedSession(value);
            },
          ),
          // sw12,
          // Container(
          //   height: 48,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(12),
          //     border: Border.all(color: AppColors.silver),
          //   ),
          //   child: Image.asset(
          //     AppImages.filter,
          //     scale: 4,
          //   ),
          // ),
          sh20,
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: homeController.courseSessions.length,
                  itemBuilder: (context, index) {
                    var session = homeController.courseSessions[index];
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              index == homeController.courseSessions.length - 1
                                  ? 116
                                  : 12),
                      child: CourseCardWidget(
                        backgroundImage: session.thumbnail,
                        title: session.name ?? "No title",
                        description: session.description ?? "No description",
                        startDate: DateTimeFormationClass.formatDate(
                            session.startDate),
                        duration: session.duration.toString(),
                        location: session.location ?? "No location",
                        skillLevel: session.skillLevel ?? "No skill level",
                        creditPoints: session.credit ?? 0,
                        onViewDetails: () {
                          Get.to(() => SessionDetailsView(
                                id: session.id,
                              ));
                        },
                      ),
                    );
                  },
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
          SearchFiled(
            onChanged: (value) {
              homeController.onSearchQueryChangedTrainer(value);
            },
          ),
          sh20,
          Expanded(
            child: Obx(
              () {
                return GridView.builder(
                  padding: EdgeInsets.only(bottom: 116),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 220,
                  ),
                  itemCount: homeController.trainerList.length,
                  itemBuilder: (context, index) {
                    var trainer = homeController.trainerList[index];
                    return ProfileCardWidget(
                      name: trainer.name ?? 'Unknown',
                      rating: trainer.avgRating ?? 0.0,
                      experience: (trainer.experience ?? 0).toString(),
                      hourlyRate: (trainer.perHourRate ?? 0).toString(),
                      profileImage:
                          trainer.photoUrl ?? AppImages.profileImageTwo,
                      onTap: () {
                        Get.to(() => TrainerProfileView(
                              id: trainer.id,
                            ));
                      },
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
