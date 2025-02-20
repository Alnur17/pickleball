import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/common/widgets/custom_container.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_textfield.dart';

class PasswordManagementView extends GetView {
  const PasswordManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:  Text('Password Management',style: appBarStyle,),
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh16,
            Text(
              'Current password',
              style: h4,
            ),
            sh12,
            CustomTextField(
              hintText: '**********',
              sufIcon: Image.asset(
                AppImages.eyeClose,
                scale: 4,
              ),
            ),
            sh16,
            Text(
              'New Password',
              style: h4,
            ),
            sh12,
            CustomTextField(
              sufIcon: Image.asset(
                AppImages.eyeClose,
                scale: 4,
              ),
              hintText: '**********',
            ),
            sh16,
            Text(
              'Confirm New Password',
              style: h4,
            ),
            sh12,
            CustomTextField(
              sufIcon: Image.asset(
                AppImages.eyeClose,
                scale: 4,
              ),
              hintText: '**********',
            ),
            sh16,
            Center(
              child: CustomContainer(
                text: 'Update Password',
                imagePath: AppImages.arrowFlyWhite,
                onTap: () {},
                height: 35,
                width: 170,
                backgroundColor: AppColors.textColorBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
