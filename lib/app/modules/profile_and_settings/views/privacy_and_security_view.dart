import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/common/app_text_style/styles.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/const_text/const_text.dart';
import '../../../../common/size_box/custom_sizebox.dart';

class PrivacyAndSecurityView extends GetView {
  const PrivacyAndSecurityView({super.key});
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh30,
              // Text(
              //   'Privacy Policy',
              //   style: h2,
              // ),
              // sh24,
              Text(
                policyIntroduction,
                style: h4.copyWith(
                  fontSize: 14,
                ),
              ),
              sh24,
              Text(
                policyIntroduction,
                style: h4.copyWith(
                  fontSize: 14,
                ),
              ),
              sh24,
              Text(
                policyIntroduction,
                style: h4.copyWith(
                  fontSize: 14,
                ),
              ),
              sh24,
              Text(
                policyIntroduction,
                style: h4.copyWith(
                  fontSize: 14,
                ),
              ), sh24,
              Text(
                policyIntroduction,
                style: h4.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
