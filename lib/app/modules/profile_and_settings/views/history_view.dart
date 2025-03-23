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
  void initState() {
    super.initState();
    bookingController.fetchAllBooking();
  }

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
        body: Obx(
              () => bookingController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
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
                            onChanged: (value) {},
                          ),
                          sh20,
                          Expanded(
                            child: bookingController.completedBookings.isEmpty
                                ? const Center(child: Text("No completed bookings"))
                                : ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: bookingController.completedBookings.length,
                              itemBuilder: (context, index) {
                                final booking = bookingController.completedBookings[index];
                                return BookingCompletedHistoryCard(
                                  coachName: booking.session?.description ?? "Coach John Smith",
                                  sessionTitle: booking.session?.name ?? "Doubles Strategy Masterclass",
                                  date: DateTimeFormationClass.formatDate(booking.session?.startDate),
                                  amountPaid: booking.session?.price.toString() ?? '',
                                  startTime: booking.slot?.startTime ?? '',
                                  endTime: booking.slot?.endTime ?? '',
                                  imageUrl: booking.session?.thumbnail ?? AppImages.profileImageTwo,
                                  status: booking.status,
                                  // onRebook: () => print("Rebook Pressed"),
                                  // onLeaveReview: booking.status == "Complete"
                                  //     ? () => Get.to(() => WriteReviewView())
                                  //     : null,
                                  onViewRefund: booking.status == "Canceled"
                                      ? () => print("View Refund Pressed")
                                      : null,
                                );
                              },
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
                            onChanged: (value) {},
                          ),
                          sh20,
                          Expanded(
                            child: bookingController.upcomingBookings.isEmpty
                                ? const Center(child: Text("No upcoming bookings"))
                                : ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: bookingController.upcomingBookings.length,
                              itemBuilder: (context, index) {
                                final booking = bookingController.upcomingBookings[index];
                                return BookingUpcomingHistoryCard(
                                  coachName: booking.session?.description ?? "Coach John Smith",
                                  sessionTitle: booking.session?.name ?? "Doubles Strategy Masterclass",
                                  date: DateTimeFormationClass.formatDate(booking.session?.startDate),
                                  amountPaid: booking.session?.price.toString() ?? '',
                                  startTime: booking.slot?.startTime ?? '',
                                  endTime: booking.slot?.endTime ?? '',
                                  imageUrl: booking.session?.thumbnail ?? AppImages.profileImageTwo,
                                  onCancel: () => print("Cancel ${booking.session?.name}"),
                                );
                              },
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
      ),
    );
  }
}
