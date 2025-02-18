import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/common/app_text_style/styles.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/helper_widget/custom_notifications_section.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_container.dart';

class NotificationsView extends GetView {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            AppImages.back,
            scale: 4,
          ),
        ),
        title: Text(
          'Notifications',
          style: appBarStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // CustomRowHeader(
              //   title: 'Booking Notifications',
              //   subtitle: Image.asset(
              //     AppImages.toggleButton,
              //     scale: 4,
              //   ),
              //   onTap: () {},
              // ),
              // sh12,
              // CustomRowItem(
              //   imagePath: AppImages.checkBoxCircleFilled,
              //   label: 'Session Confirmations',
              // ),
              // sh10,
              // CustomRowItem(
              //   imagePath: AppImages.checkBoxCircle,
              //   label: 'Reschedule Alerts',
              // ),
              // sh10,
              // CustomRowItem(
              //   imagePath: AppImages.checkBoxCircle,
              //   label: 'Cancellations',
              // ),

              CustomNotificationSection(
                title: 'Booking Notifications',
                toggleIcon: Image.asset(
                  AppImages.toggleButton,
                  scale: 4,
                ),
                items: [
                  {
                    'imagePath': AppImages.checkBoxCircleFilled,
                    'label': 'Session Confirmations'
                  },
                  {
                    'imagePath': AppImages.checkBoxCircle,
                    'label': 'Reschedule Alerts'
                  },
                  {
                    'imagePath': AppImages.checkBoxCircle,
                    'label': 'Cancellations'
                  },
                ],
                onTap: () {},
              ),
              sh20,
              CustomNotificationSection(
                title: 'Payment Notifications',
                toggleIcon: Image.asset(
                  AppImages.toggleButton,
                  scale: 4,
                ),
                items: [
                  {
                    'imagePath': AppImages.checkBoxCircle,
                    'label': 'Subscription Renewal Reminder'
                  },
                  {
                    'imagePath': AppImages.checkBoxCircle,
                    'label': 'Payment Success'
                  },
                  {
                    'imagePath': AppImages.checkBoxCircle,
                    'label': 'Refund Processed'
                  },
                ],
                onTap: () {},
              ),
              sh20,
              CustomNotificationSection(
                title: 'App Announcements',
                toggleIcon: Image.asset(
                  AppImages.toggleButton,
                  scale: 4,
                ),
                items: [
                  {
                    'imagePath': AppImages.checkBoxCircle,
                    'label': 'New Features & Updates'
                  },
                  {
                    'imagePath': AppImages.checkBoxCircle,
                    'label': 'Promotions & Discounts'
                  },
                ],
                onTap: () {},
              ),
              sh20,
              CustomNotificationSection(
                title: 'Notification Preference',
                toggleIcon: Image.asset(
                  AppImages.toggleButton,
                  scale: 4,
                ),
                items: [
                  {
                    'imagePath': AppImages.checkBoxCircle,
                    'label': 'Push Notifications'
                  },
                ],
                onTap: () {},
              ),
              sh50,
              Center(
                child: CustomContainer(
                  text: 'Save Changes',
                  imagePath: AppImages.arrowFly,
                  onTap: () {},
                  height: 35,
                  width: 170,
                  backgroundColor: AppColors.textColorBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
