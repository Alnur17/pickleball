import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/common/helper_widget/booking_card_confirm_widget.dart';
import 'package:pickleball/common/helper_widget/date_time_formation_class.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
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
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SearchFiled(
                          onChanged: (value) {},
                        ),
                        sh20,
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: index == 5 - 1 ? 116 : 8,
                                ),
                                child: BookingCardConfirmWidget(
                                  coachName: "Coach John Smith",
                                  sessionTitle: "Doubles Strategy Masterclass",
                                  date: "25 January 2025",
                                  time: "2:00 PM - 3:00 PM",
                                  imageUrl: AppImages.profileImageTwo,
                                  onCancel: () {
                                    // Handle cancel action
                                  },
                                ),
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
                        SearchFiled(
                          onChanged: (value) {},
                        ),
                        sh20,
                        Obx(
                          () => Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              // padding: EdgeInsets.only(bottom: 116),
                              itemCount: bookingController.waitListList.length,
                              itemBuilder: (context, index) {
                                var waitlistBooking =
                                    bookingController.waitListList[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: index == bookingController.waitListList.length - 1 ? 116 : 12),
                                  child: BookingCardWaitlistWidget(
                                    coachName: waitlistBooking.session?.coach?.user?.name ?? "Unknown",
                                    sessionTitle: waitlistBooking.session?.name ??
                                        "Unknown",
                                    date: DateTimeFormationClass.formatDate(
                                        waitlistBooking.createdAt),
                                    imageUrl: waitlistBooking.session?.coach?.user?.photoUrl ?? AppImages.profileImageTwo,
                                    onCancel: () {
                                      // Handle cancel action
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
}
