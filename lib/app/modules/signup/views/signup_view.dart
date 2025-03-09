import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/signup/controllers/signup_controller.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_textfield.dart';
import '../../login/views/login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  SignupController signupController = Get.put(SignupController());

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
                  CustomTextField(
                    hintText: 'Enter your full name',
                    controller: signupController.nameController,
                  ),
                  sh12,
                  Text('Mobile Number', style: h4),
                  sh8,
                  CustomTextField(
                    hintText: 'Your mobile number',
                    controller: signupController.contactNumberController,
                  ),
                  sh12,
                  Text('Email', style: h4),
                  sh8,
                  CustomTextField(
                    hintText: 'Your email',
                    controller: signupController.emailController,
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
                    controller: signupController.passwordController,
                    //obscureText: true,
                  ),
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
                  signupController.registerUser();  // Trigger registration
                },
                gradientColors: AppColors.gradientColor,
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
