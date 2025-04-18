import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:pickleball/common/app_text_style/styles.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../controllers/conditions_controller.dart';

class PrivacyAndSecurityView extends StatefulWidget {
  const PrivacyAndSecurityView({super.key});

  @override
  State<PrivacyAndSecurityView> createState() => _PrivacyAndSecurityViewState();
}

class _PrivacyAndSecurityViewState extends State<PrivacyAndSecurityView> {
  final ConditionsController controller = Get.put(ConditionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        titleSpacing: 20,
        title: Text('Privacy & Security',style: appBarStyle,),

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (controller.errorMessage.isNotEmpty) {
              return Center(
                child: Text(
                  controller.errorMessage.value,
                  style: h4.copyWith(fontSize: 14, color: AppColors.red),
                ),
              );
            } else {
              return Html(
                data: controller.getPrivacyPolicy(), // Render HTML content
                // style: {
                //   // Optional: Customize HTML rendering styles
                //   "body": Style(
                //     fontSize: FontSize(14),
                //     color: AppColors.black, // Adjust as per your theme
                //   ),
                // },
              );
            }
          }),
        ),
      ),
    );
  }
}
