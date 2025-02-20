import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';
import 'package:pickleball/common/widgets/search_filed.dart';
import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/widgets/custom_button.dart';

class NotificationView extends GetView {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationItem> notifications = [
      NotificationItem(
        title: "Good news! A spot just opened up!",
        subtitle:
            "A spot is now available for the March 8, 2025, 6:00 PM session. You have 25:27 minutes to confirm before it's offered to the next user!",
        time: "2 hours ago",
        image: AppImages.soundBlue,
        color: AppColors.textColorBlue,
        hasActions: true,
      ),
      NotificationItem(
        title: "Your session is confirmed!",
        subtitle:
            "You've successfully booked a Pickleball session on March 10, 2025, at 5:00 PM with Coach Alex at Sunset Pickleball Club.",
        time: "2 hours ago",
        image: AppImages.soundGreenLight,
        color: AppColors.lightGreenTwo,
      ),
      NotificationItem(
        title: "Session canceled",
        subtitle:
            "Your Pickleball session on March 12, 2025, at 4:00 PM has been canceled by the organizer. A refund has been processed.",
        time: "2 hours ago",
        image: AppImages.soundRed,
        color: AppColors.red,
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Notification',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh20,
            SearchFiled(
              onChanged: (value) {},
            ),
            sh20,
            Text(
              'New',
              style: h4.copyWith(
                color: AppColors.textColorBlue,
              ),
            ),
            sh20,
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return NotificationContainer(item: notifications[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
  final NotificationItem item;

  const NotificationContainer({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: item.color),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: 35,
              //   width: 35,
              //   padding: EdgeInsets.all(8),
              //   decoration:
              //       ShapeDecoration(shape: CircleBorder(), color: item.color),
              //   child: Image.asset(
              //     AppImages.sound,
              //     scale: 4,
              //   ),
              // ),
              Image.asset(
                item.image,
                scale: 4,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
              Text(item.time, style: const TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            item.subtitle,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          if (item.hasActions) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    height: 40,
                    text: 'Confirm',
                    onPressed: () {},
                    borderColor: AppColors.blue,
                    borderRadius: 12,
                    textColor: AppColors.blue,
                    backgroundColor: AppColors.textColorBlueLight,
                  ),
                ),
                sw20,
                Expanded(
                  child: CustomButton(
                    height: 40,
                    text: 'Cancel',
                    onPressed: () {},
                    borderColor: AppColors.red,
                    borderRadius: 12,
                    textColor: AppColors.red,
                    backgroundColor: AppColors.redLight,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String subtitle;
  final String time;
  final String image;
  final Color color;
  final bool hasActions;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.image,
    required this.color,
    this.hasActions = false,
  });
}
