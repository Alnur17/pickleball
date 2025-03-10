import 'package:flutter/material.dart';

import 'package:get/get.dart';
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

// class MySearchView extends GetView<MySearchController> {
//   const MySearchView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: AppColors.mainColor,
//         appBar: AppBar(
//           backgroundColor: AppColors.mainColor,
//           scrolledUnderElevation: 0,
//           automaticallyImplyLeading: false,
//           toolbarHeight: 0,
//         ),
//         body: Column(
//           children: [
//             TabBar(
//               tabs: [
//                 Tab(text: 'Sessions'),
//                 Tab(
//                   text: 'Trainers',
//                 ),
//               ],
//               indicatorSize: TabBarIndicatorSize.tab,
//               indicatorColor: Colors.lightGreen,
//               labelColor: Colors.lightGreen,
//               unselectedLabelColor: AppColors.black,
//               dividerColor: AppColors.transparent,
//               padding: EdgeInsets.symmetric(horizontal: 80),
//             ),
//             sh16,
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: SearchFiled(
//                                 onChanged: (value) {},
//                               ),
//                             ),
//                             sw12,
//                             Container(
//                               height: 48,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   border: Border.all(color: AppColors.silver)),
//                               child: Image.asset(
//                                 AppImages.filter,
//                                 scale: 4,
//                               ),
//                             ),
//                           ],
//                         ),
//                         sh20,
//                         Expanded(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             primary: false,
//                             itemCount: 5,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(
//                                   bottom: index == 5 - 1 ? 116 : 12,
//                                 ),
//                                 child: CourseCardWidget(
//                                   height: 350,
//                                   width: double.infinity,
//                                   title: "Doubles Strategy Masterclass",
//                                   description:
//                                       "Master the art of playing doubles in this comprehensive session designed for intermediate to advanced Pickleball players...",
//                                   date: "25 January 2025",
//                                   time: "2:00 PM - 3:00 PM",
//                                   location:
//                                       "Sunset Pickleball Club, Miami Beach",
//                                   skillLevel: "Beginner",
//                                   price: "25",
//                                   onViewDetails: () {
//                                     Get.to(()=> SessionDetailsView());
//                                   },
//                                 ),
//                               );
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: SearchFiled(
//                                 onChanged: (value) {},
//                               ),
//                             ),
//                             sw12,
//                             Container(
//                               height: 48,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   border: Border.all(color: AppColors.silver)),
//                               child: Image.asset(
//                                 AppImages.filter,
//                                 scale: 4,
//                               ),
//                             ),
//                           ],
//                         ),
//                         sh20,
//                         Expanded(
//                           child: GridView.builder(
//                             shrinkWrap: true,
//                             primary: false,
//                             padding: EdgeInsets.only(bottom: 116),
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               crossAxisSpacing: 20,
//                               mainAxisSpacing: 20,
//                               childAspectRatio: 0.9,
//                             ),
//                             itemCount: 20,
//                             itemBuilder: (context, index) {
//                               return ProfileCardWidget(
//                                 name: 'John Smith',
//                                 rating: 4.5,
//                                 experience: '10+ Years',
//                                 hourlyRate: '50/hour',
//                                 profileImage: AppImages.profileImageTwo,
//                                 onTap: () {
//                                   Get.to(()=> TrainerProfileView());
//                                 },
//                               );
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MySearchView extends GetView<MySearchController> {
  final int tabIndex;
  final bool showBackButton;

  const MySearchView({
    super.key,
    this.tabIndex = 0,
    this.showBackButton = false,
  }); // Default to 'Sessions'

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: tabIndex, // Set initial tab
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
          _buildSearchBar(),
          sh20,
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: index == 4 ? 116 : 12),
                  child: CourseCardWidget(
                    title: "Doubles Strategy Masterclass",
                    description: "Master the art of doubles in Pickleball...",
                    date: "25 January 2025",
                    startTime: "2:00 PM",
                    endTime: "3:00 PM",
                    location: "Sunset Pickleball Club, Miami Beach",
                    skillLevel: "Beginner",
                    price: 25,
                    onViewDetails: () {
                      Get.to(() => SessionDetailsView());
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
          _buildSearchBar(),
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
              itemCount: 20,
              itemBuilder: (context, index) {
                return ProfileCardWidget(
                  name: 'John Smith',
                  rating: 4,
                  experience: '10+ Years',
                  hourlyRate: '50/hour',
                  profileImage: AppImages.profileImageTwo,
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

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: SearchFiled(
            onChanged: (value) {},
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
    );
  }
}
