import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/common/helper_widget/booking_card_confirm_widget.dart';
import 'package:pickleball/common/helper_widget/date_time_formation_class.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper_widget/booking_card_waitlist_widget.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/search_filed.dart';
import '../controllers/booking_controller.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final BookingController bookingController = Get.put(BookingController());


  @override
  void initState() {
    super.initState();
    bookingController.fetchWaitlist();
    bookingController.fetchAllBooking();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Confirmed'),
                Tab(text: 'Waitlist'),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.lightGreen,
              labelColor: Colors.lightGreen,
              unselectedLabelColor: AppColors.black,
              dividerColor: AppColors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 45),
            ),
            sh16,
            Expanded(
              child:
                  // Obx(
                  //   () => bookingController.isLoading.value
                  //       ? const Center(child: CircularProgressIndicator())
                  //       :
                  TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SearchFiled(
                          onChanged: (value) {
                            bookingController
                                .onSearchQueryChangedAllMyBooking(value);
                          },
                        ),
                        sh20,
                        Expanded(
                          child: Obx(
                            () => bookingController.confirmBooking.isEmpty
                                ? const Center(
                                    child: Text("No confirmed bookings"))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount:
                                        bookingController.confirmBooking.length,
                                    itemBuilder: (context, index) {
                                      var confirmData = bookingController
                                          .confirmBooking[index];
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom: index ==
                                                    bookingController
                                                            .confirmBooking
                                                            .length -
                                                        1
                                                ? 116
                                                : 8),
                                        child: BookingCardConfirmWidget(
                                          coachName: confirmData
                                                  .session?.coach?.name ??
                                              "Unknown",
                                          sessionTitle:
                                              confirmData.session?.name ??
                                                  "Unknown",
                                          date:
                                              DateTimeFormationClass.formatDate(
                                                  confirmData
                                                      .session?.startDate),
                                          startTime:
                                              confirmData.slot?.startTime ?? '',
                                          endTime:
                                              confirmData.slot?.endTime ?? '',
                                          imageUrl: confirmData
                                                  .session?.coach?.photoUrl ??
                                              AppImages.profileImageTwo,
                                          onCancel: () {
                                            _showCancelPopup(confirmData);
                                            // bookingController
                                            //    .cancelBooking(
                                            //        confirmData.id!);
                                          },
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SearchFiled(
                          onChanged: (value) {
                            bookingController
                                .onSearchQueryChangedWaitlist(value);
                          },
                        ),
                        sh20,
                        Obx(
                          () => bookingController.waitListList.isEmpty
                              ? const Center(
                                  child: Text("No waitlist bookings"))
                              : Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    // padding: EdgeInsets.only(bottom: 116),
                                    itemCount:
                                        bookingController.waitListList.length,
                                    itemBuilder: (context, index) {
                                      var waitlistBooking =
                                          bookingController.waitListList[index];
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom: index ==
                                                    bookingController
                                                            .waitListList
                                                            .length -
                                                        1
                                                ? 116
                                                : 12),
                                        child: BookingCardWaitlistWidget(
                                          coachName: waitlistBooking
                                                  .session?.coach?.user?.name ??
                                              "Unknown",
                                          sessionTitle:
                                              waitlistBooking.session?.name ??
                                                  "Unknown",
                                          date:
                                              DateTimeFormationClass.formatDate(
                                                  waitlistBooking.createdAt),
                                          imageUrl: waitlistBooking.session
                                                  ?.coach?.user?.photoUrl ??
                                              AppImages.profileImageTwo,
                                          onCancel: () {
                                            bookingController.removeWaitlist(
                                                waitlistBooking.id!);
                                            debugPrint(
                                                '::::::::::::: ${waitlistBooking.id} :::::::::::');
                                          },
                                        ),
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

  void _showCancelPopup(dynamic confirmData) {
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
                  bookingController.cancelBooking(confirmData.id!);
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
}
