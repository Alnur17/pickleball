import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/common/widgets/custom_loader.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_textfield.dart';
import '../../forgot_password/views/forgot_password_view.dart';
import '../../signup/views/signup_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController loginController = Get.put(LoginController());

  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();

  final isChecked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        titleSpacing: 20,
        title: Text(
          'Log In',
          style: appBarStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh12,
              Text(
                'Hi, Welcome back!',
                style: h2.copyWith(fontWeight: FontWeight.w700),
              ),
              sh12,
              Text(
                'Login to continue exploring the best deals',
                style: h4,
              ),
              sh40,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email', style: h4),
                  sh8,
                  CustomTextField(
                    controller: emailTEController,
                    hintText: 'Your email',
                  ),
                  const SizedBox(height: 12),
                  Text('Password', style: h4),
                  sh8,
                  Obx(() => CustomTextField(
                    controller: passwordTEController,
                    sufIcon: GestureDetector(
                      onTap: () {
                        loginController.togglePasswordVisibility();
                      },
                      child: Image.asset(
                        loginController.isPasswordVisible.value
                            ? AppImages.eye
                            : AppImages.eyeClose,
                        scale: 4,
                      ),
                    ),
                    obscureText: !loginController.isPasswordVisible.value,
                    hintText: '**********',
                  ),),
                ],
              ),
              sh16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          isChecked.value = !isChecked.value; // Toggle using GetX
                        },
                        child: Obx(() => Image.asset(
                          isChecked.value ? AppImages.checkBoxCircleFilled : AppImages.checkBoxCircle,
                          scale: 4,
                        )),
                      ),
                      sw16,
                      Text(
                        'Remember Me',
                        style: h4,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ForgotPasswordView());
                    },
                    child: Text(
                      'Forgot password?',
                      style: h4.copyWith(color: AppColors.red),
                    ),
                  ),
                ],
              ),
              sh24,
              Obx(
                () {
                  return loginController.isLoading.value == true
                      ? CustomLoader(color: AppColors.white)
                      : CustomButton(
                          text: 'Login',
                          onPressed: () {
                            loginController.userLogin(
                              email: emailTEController.text,
                              password: passwordTEController.text,
                            );
                          },
                          gradientColors: AppColors.gradientColor,
                        );
                },
              ),
              sh20,
              GestureDetector(
                onTap: () {
                  Get.to(() => const SignupView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                      style: h4,
                    ),
                    Text(
                      'Sign Up',
                      style: h4.copyWith(
                          color: AppColors.textColorBlueV2,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
