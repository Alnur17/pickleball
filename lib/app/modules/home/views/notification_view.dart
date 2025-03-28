import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';
import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../controllers/notifications_controller.dart';
import '../model/notification_model.dart';

class NotificationView extends GetView<NotificationsController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController());

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
           // sh20,
            // SearchFiled(
            //   onChanged: (value) {
            //
            //   },
            // ),
            sh20,
            Expanded(
              child: Obx(() => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                itemCount: controller.notificationList.length,
                itemBuilder: (context, index) {
                  return NotificationContainer(
                    item: controller.notificationList[index],
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
  final Datum item;

  const NotificationContainer({super.key, required this.item});

  // Helper method to determine color and image based on message content
  (Color, String) _getNotificationStyle() {
    if (item.message?.toLowerCase().contains('confirmed') == true) {
      return (AppColors.lightGreenTwo, AppImages.soundGreenLight);
    } else if (item.message?.toLowerCase().contains('canceled') == true) {
      return (AppColors.red, AppImages.soundRed);
    } else {
      return (AppColors.textColorBlue, AppImages.soundBlue);
    }
  }

  // Helper method to format time difference
  String _formatTime(DateTime? dateTime) {
    if (dateTime == null) return '';
    final difference = DateTime.now().difference(dateTime);
    if (difference.inHours < 1) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }

  @override
  Widget build(BuildContext context) {
    final (color, image) = _getNotificationStyle();

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: 4,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.message ?? 'Notification',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
              Text(
                _formatTime(item.createdAt),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            item.description ?? '',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
