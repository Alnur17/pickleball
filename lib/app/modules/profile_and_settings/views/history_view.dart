import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/app/modules/profile_and_settings/views/write_review_view.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/helper_widget/booking_completed_history_card.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/helper_widget/booking_upcoming_history_card.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/search_filed.dart';

class HistoryView extends GetView {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          scrolledUnderElevation: 0,
          title: Text(
            'History',
            style: appBarStyle,
          ),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              AppImages.back,
              scale: 4,
            ),
          ),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Completed'),
                Tab(text: 'Upcoming'),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
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
                                  border: Border.all(color: AppColors.silver)),
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
                            shrinkWrap: true,
                            primary: false,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  BookingCompletedHistoryCard(
                                    coachName: "Coach John Smith",
                                    sessionTitle: "Doubles Strategy Masterclass",
                                    date: "25 January 2025",
                                    amountPaid: '50',
                                    time: "2:00 PM - 3:00 PM",
                                    imageUrl: AppImages.profileImageTwo,
                                    status: "Complete",
                                    onRebook: () => print("Rebook Pressed"),
                                    onLeaveReview: () {
                                      Get.to(() => WriteReviewView());
                                    }
                                  ),
                                  BookingCompletedHistoryCard(
                                    coachName: "Coach John Smith",
                                    sessionTitle: "Doubles Strategy Masterclass",
                                    amountPaid: '50',
                                    date: "25 January 2025",
                                    time: "2:00 PM - 3:00 PM",
                                    imageUrl: AppImages.profileImageTwo,
                                    status: "Canceled",
                                    onRebook: () => print("Rebook Pressed"),
                                    onViewRefund: () {

                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
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
                                  border: Border.all(color: AppColors.silver)),
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
                            shrinkWrap: true,
                            primary: false,
                            // padding: EdgeInsets.only(bottom: 116),
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return BookingUpcomingHistoryCard(
                                coachName: "Coach John Smith",
                                sessionTitle: "Doubles Strategy Masterclass",
                                date: "25 January 2025",
                                amountPaid: "50",
                                time: "2:00 PM - 3:00 PM",
                                imageUrl: AppImages.profileImageTwo,
                                onReschedule: () => print("Reschedule pressed"),
                                onCancel: () => print("Cancel Booking pressed"),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
