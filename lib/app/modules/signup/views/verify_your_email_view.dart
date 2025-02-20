import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../login/views/login_view.dart';

class VerifyYourEmailView extends GetView {
  const VerifyYourEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text('Verify Your Email',style: appBarStyle),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            AppImages.back,
            scale: 4,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            sh30,
            Text(
              'Enter OTP',
              style: h4,
            ),
            sh20,
            Text(
              'We have just sent you 4 digit code via your email.',
              style: h5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: PinCodeTextField(
                length: 4,
                obscureText: false,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 90,
                  fieldWidth: 80,
                  // Reduce the width slightly for the gap
                  activeColor: AppColors.borderColor,
                  activeFillColor: AppColors.white,
                  inactiveColor: AppColors.borderColor,
                  inactiveFillColor: AppColors.white,
                  selectedColor: AppColors.blue,
                  selectedFillColor: AppColors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: AppColors.transparent,
                cursorColor: AppColors.blue,
                enablePinAutofill: true,
                enableActiveFill: true,
                onCompleted: (v) {},
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  log("Allowing to paste $text");
                  return true;
                },
                appContext: context,
              ),
            ),
            sh20,
            CustomButton(
              text: 'Verify',
              onPressed: () {
                Get.to(() => const LoginView());
              },
              gradientColors: AppColors.gradientColor,
            ),
            sh30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t receive any code?',
                  style: h3,
                ),
                sw8,
                Text(
                  'Resend code',
                  style: h3.copyWith(color: AppColors.textColorBlue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
