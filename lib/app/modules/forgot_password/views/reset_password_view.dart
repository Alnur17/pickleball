import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/app/modules/forgot_password/controllers/forgot_password_controller.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_loader.dart';
import '../../../../common/widgets/custom_textfield.dart';

class ResetPasswordView extends GetView {
  final String email;

  ResetPasswordView({super.key, required this.email});

  final ForgotPasswordController forgotPasswordController =
      Get.find<ForgotPasswordController>();
  final TextEditingController newPasswordTEController = TextEditingController();
  final TextEditingController confirmPasswordTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text('Reset Password', style: appBarStyle),
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
            sh30,
            Align(
              alignment: Alignment.center,
              child: Text(
                'Set Your New Password',
                style: h4.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            sh16,
            Align(
              alignment: Alignment.center,
              child: Text(
                'Create a new password to secure your account.',
                style: h5,
              ),
            ),
            sh16,
            Text(
              'Enter new password',
              style: h4,
            ),
            sh12,
            CustomTextField(
              controller: newPasswordTEController,
              hintText: '**********',
              sufIcon: Image.asset(
                AppImages.eyeClose,
                scale: 4,
              ),
            ),
            sh16,
            Text(
              'Confirm Password',
              style: h4,
            ),
            sh12,
            CustomTextField(
              controller: confirmPasswordTEController,
              sufIcon: Image.asset(
                AppImages.eyeClose,
                scale: 4,
              ),
              hintText: '**********',
            ),
            sh16,
            Obx(
              () => forgotPasswordController.isLoading.value == true
                  ? CustomLoader(color: AppColors.white)
                  : CustomButton(
                      text: 'Update Password',
                      onPressed: () {
                        forgotPasswordController.resetPassword(
                          email: email.toLowerCase(),
                          newPassword: newPasswordTEController.text,
                          confirmPassword: confirmPasswordTEController.text,
                        );
                      },
                      gradientColors: AppColors.gradientColor,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
