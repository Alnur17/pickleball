import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/app/modules/signup/views/verify_your_email_view.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_textfield.dart';
import '../../login/views/login_view.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          'Signup',
          style: appBarStyle,
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 4),
            child: Image.asset(
              AppImages.back,
              scale: 4,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              sh12,
              Text(
                'Create New Account',
                style: h2.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              sh12,
              Text(
                'Please fill your detail information.',
                style: h4,
              ),
              sh16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Full Name', style: h4),
                  sh8,
                  const CustomTextField(
                    hintText: 'Enter your full name',
                  ),
                  sh12,
                  Text('Mobile Number', style: h4),
                  sh8,
                  const CustomTextField(
                    hintText: 'Your mobile number',
                  ),
                  sh12,
                  Text('Email', style: h4),
                  sh8,
                  const CustomTextField(
                    hintText: 'Your email',
                  ),
                  sh12,
                  Text('Create a Password', style: h4),
                  sh8,
                  CustomTextField(
                    sufIcon: Image.asset(
                      AppImages.eyeClose,
                      scale: 4,
                    ),
                    hintText: '**********',
                  ),
                  // sh20,
                  // Text(
                  //   'What are you more interest in?',
                  //   style: h3,
                  // ),
                  // sh12,
                  // Row(
                  //   children: [
                  //     Container(
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(40),
                  //         border: Border.all(color: AppColors.borderColor),
                  //       ),
                  //       child: Text(
                  //         'Buying',
                  //         style: h4,
                  //       ),
                  //     ),
                  //     sw16,
                  //     Container(
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(40),
                  //         border: Border.all(color: AppColors.borderColor),
                  //       ),
                  //       child: Text(
                  //         'Selling',
                  //         style: h4,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  sh20,
                  Row(
                    children: [
                      Image.asset(
                        AppImages.checkBoxFilled,
                        scale: 4,
                      ),
                      sw16,
                      Expanded(
                        child: Text(
                          'I agree to the Terms & Conditions and Privacy Policy',
                          style: h4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              sh20,
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  Get.offAll(() => const VerifyYourEmailView());
                },
              ),
              sh10,
              GestureDetector(
                onTap: () {
                  Get.offAll(() => const LoginView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: h4,
                    ),
                    Text(
                      'Log In',
                      style: h4.copyWith(
                          color: AppColors.textColorBlueV2,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              sh30,
            ],
          ),
        ),
      ),
    );
  }
}
