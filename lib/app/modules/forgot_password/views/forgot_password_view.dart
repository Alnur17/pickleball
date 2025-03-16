import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_loader.dart';
import '../../../../common/widgets/custom_textfield.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  ForgotPasswordView({super.key});

  final TextEditingController emailTEController = TextEditingController();
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text('Forgot Password', style: appBarStyle),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sh30,
            Text(
              'No worries!',
              style: h3,
            ),
            sh16,
            Text(
              'Enter your registered email address and we’ll send you instructions to reset your password. Let’s get you back on track quickly and securely!',
              style: h5,
              textAlign: TextAlign.center,
            ),
            sh30,
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email address',
                  style: h4,
                )),
            sh8,
            CustomTextField(
              controller: emailTEController,
              hintText: 'Enter your email',
              preIcon: Image.asset(
                AppImages.mail,
                scale: 4,
              ),
            ),
            sh30,
            Obx(
              () => forgotPasswordController.isLoading.value == true
                  ? CustomLoader(color: AppColors.white)
                  : CustomButton(
                      text: 'Send',
                      onPressed: () {
                        forgotPasswordController.forgotPassword(
                          email: emailTEController.text.toLowerCase(),
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
