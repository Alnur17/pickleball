// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:pickleball/app/modules/profile_and_settings/views/write_review_view.dart';
// import 'package:pickleball/common/app_text_style/styles.dart';
// import 'package:pickleball/common/helper_widget/booking_completed_history_card.dart';
//
// import '../../../../common/app_color/app_colors.dart';
// import '../../../../common/app_images/app_images.dart';
// import '../../../../common/helper_widget/booking_upcoming_history_card.dart';
// import '../../../../common/size_box/custom_sizebox.dart';
// import '../../../../common/widgets/search_filed.dart';
//
// class HistoryView extends GetView {
//   const HistoryView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: AppColors.white,
//         appBar: AppBar(
//           backgroundColor: AppColors.white,
//           scrolledUnderElevation: 0,
//           title: Text(
//             'History',
//             style: appBarStyle,
//           ),
//           leading: GestureDetector(
//             onTap: () {
//               Get.back();
//             },
//             child: Padding(
//               padding: const EdgeInsets.only(left: 20, top: 4),
//               child: Image.asset(
//                 AppImages.back,
//                 scale: 4,
//               ),
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             TabBar(
//               tabs: [
//                 Tab(text: 'Completed'),
//                 Tab(text: 'Upcoming'),
//               ],
//               indicatorSize: TabBarIndicatorSize.tab,
//               indicatorColor: Colors.lightGreen,
//               labelColor: Colors.lightGreen,
//               unselectedLabelColor: AppColors.black,
//               dividerColor: AppColors.transparent,
//               padding: EdgeInsets.symmetric(horizontal: 45),
//             ),
//             sh16,
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       children: [
//                         SearchFiled(
//                           onChanged: (value) {},
//                         ),
//                         sh20,
//                         Expanded(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             primary: false,
//                             itemCount: 5,
//                             itemBuilder: (context, index) {
//                               return Column(
//                                 children: [
//                                   BookingCompletedHistoryCard(
//                                     coachName: "Coach John Smith",
//                                     sessionTitle: "Doubles Strategy Masterclass",
//                                     date: "25 January 2025",
//                                     amountPaid: '50',
//                                     time: "2:00 PM - 3:00 PM",
//                                     imageUrl: AppImages.profileImageTwo,
//                                     status: "Complete",
//                                     onRebook: () => print("Rebook Pressed"),
//                                     onLeaveReview: () {
//                                       Get.to(() => WriteReviewView());
//                                     }
//                                   ),
//                                   BookingCompletedHistoryCard(
//                                     coachName: "Coach John Smith",
//                                     sessionTitle: "Doubles Strategy Masterclass",
//                                     amountPaid: '50',
//                                     date: "25 January 2025",
//                                     time: "2:00 PM - 3:00 PM",
//                                     imageUrl: AppImages.profileImageTwo,
//                                     status: "Canceled",
//                                     onRebook: () => print("Rebook Pressed"),
//                                     onViewRefund: () {
//
//                                     },
//                                   ),
//                                 ],
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
//                         SearchFiled(
//                           onChanged: (value) {},
//                         ),
//                         sh20,
//                         Expanded(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             primary: false,
//                             // padding: EdgeInsets.only(bottom: 116),
//                             itemCount: 20,
//                             itemBuilder: (context, index) {
//                               return BookingUpcomingHistoryCard(
//                                 coachName: "Coach John Smith",
//                                 sessionTitle: "Doubles Strategy Masterclass",
//                                 date: "25 January 2025",
//                                 amountPaid: "50",
//                                 time: "2:00 PM - 3:00 PM",
//                                 imageUrl: AppImages.profileImageTwo,
//                                 onCancel: () => print("Cancel Booking pressed"),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/helper_widget/booking_completed_history_card.dart';
import 'package:pickleball/common/helper_widget/date_time_formation_class.dart';
import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/helper_widget/booking_upcoming_history_card.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/search_filed.dart';
import '../../booking/controllers/booking_controller.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final BookingController bookingController = Get.put(BookingController());

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
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 4),
              child: Image.asset(
                AppImages.back,
                scale: 4,
              ),
            ),
          ),
        ),
        body:
            // Obx(
            //       () => bookingController.isLoading.value
            //       ? const Center(child: CircularProgressIndicator())
            //       :
            Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: 'Completed'),
                Tab(text: 'Upcoming'),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.lightGreen,
              labelColor: Colors.lightGreen,
              unselectedLabelColor: AppColors.black,
              dividerColor: AppColors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 45),
            ),
            sh16,
            Expanded(
              child: TabBarView(
                children: [
                  // Completed Tab
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SearchFiled(
                          onChanged: (value) {
                            if (value.isEmpty) {
                              bookingController.fetchAllBooking(null);
                            } else {
                              bookingController
                                  .onSearchQueryChangedAllMyBooking(value);
                            }
                          },
                        ),
                        sh20,
                        Expanded(
                          child: Obx(
                            () => bookingController.completedBookings.isEmpty
                                ? const Center(
                                    child: Text("No completed bookings"))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: bookingController
                                        .completedBookings.length,
                                    itemBuilder: (context, index) {
                                      final booking = bookingController
                                          .completedBookings[index];
                                      return BookingCompletedHistoryCard(
                                        coachName: booking
                                                .session?.coach?.user?.name ??
                                            "Unknown",
                                        sessionTitle:
                                            booking.session?.name ?? "Unknown",
                                        date: DateTimeFormationClass.formatDate(
                                            booking.session?.startDate),
                                        amountPaid: booking.amount.toString(),
                                        startTime:
                                            booking.slot?.startTime ?? '',
                                        endTime: booking.slot?.endTime ?? '',
                                        imageUrl: booking.session?.coach?.user
                                                ?.photoUrl ??
                                            AppImages.profileImageTwo,
                                        status: booking.status,
                                        // onRebook: () => print("Rebook Pressed"),
                                        // onLeaveReview: booking.status == "Complete"
                                        //     ? () => Get.to(() => WriteReviewView())
                                        //     : null,
                                        // onViewRefund:
                                        //     booking.status == "Canceled"
                                        //         ? () => debugPrint(
                                        //             "View Refund Pressed")
                                        //         : null,
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Upcoming Tab
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SearchFiled(
                          onChanged: (value) {
                            if (value.isEmpty) {
                              bookingController.fetchAllBooking(null);
                            } else {
                              bookingController
                                  .onSearchQueryChangedAllMyBooking(value);
                            }
                          },
                        ),
                        sh20,
                        Expanded(
                          child: Obx(
                            () => bookingController.upcomingBookings.isEmpty
                                ? const Center(
                                    child: Text("No upcoming bookings"))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: bookingController
                                        .upcomingBookings.length,
                                    itemBuilder: (context, index) {
                                      final booking = bookingController
                                          .upcomingBookings[index];
                                      return BookingUpcomingHistoryCard(
                                        coachName: booking
                                                .session?.coach?.user?.name ??
                                            "Unknown",
                                        sessionTitle:
                                            booking.session?.name ?? "Unknown",
                                        date: DateTimeFormationClass.formatDate(
                                            booking.session?.startDate),
                                        amountPaid: booking.amount.toString(),
                                        startTime:
                                            booking.slot?.startTime ?? '',
                                        endTime: booking.slot?.endTime ?? '',
                                        imageUrl: booking.session?.coach?.user
                                                ?.photoUrl ??
                                            AppImages.profileImageTwo,
                                        onCancel: () {
                                          _showCancelPopup(booking);
                                        },
                                      );
                                    },
                                  ),
                          ),
                        ),
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

  void _showCancelPopup(dynamic booking) {
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('You really want to cancel the course?',
            style: h3, textAlign: TextAlign.center),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () {
                  Get.back();
                  _showRefundPopup(booking);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.red, width: 1.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minimumSize: Size(100, 40),
                ),
                child: Text(
                  'Yes',
                  style: h3.copyWith(fontSize: 14, color: AppColors.red),
                ),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minimumSize: Size(100, 40),
                ),
                child: Text(
                  'No',
                  style: h3.copyWith(fontSize: 14, color: AppColors.mainColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showRefundPopup(dynamic booking) {
    Get.dialog(
      barrierDismissible: false,
      PopScope(
        canPop: false,
        child: AlertDialog(
          backgroundColor: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title:
              Text('Click to refund', style: h3, textAlign: TextAlign.center),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            OutlinedButton(
              onPressed: () {
                Get.back();
                bookingController.cancelBooking(booking.id!);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                minimumSize: Size(100, 40),
              ),
              child: Text(
                'Refund',
                style: h3.copyWith(fontSize: 14, color: AppColors.mainColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
