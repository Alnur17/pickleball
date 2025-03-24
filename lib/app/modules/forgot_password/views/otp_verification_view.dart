import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/widgets/custom_loader.dart';

class OtpVerificationView extends GetView<ForgotPasswordController> {
  final String email;

  OtpVerificationView({super.key, required this.email});

  final TextEditingController otpTEController = TextEditingController();
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text('OTP Verification', style: appBarStyle),
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
          children: [
            sh30,
            Text(
              'Verify Your Identity',
              style: h4.copyWith(fontWeight: FontWeight.bold),
            ),
            sh20,
            Text(
              'For your security, verify the code sent to your registered contact. Let’s confirm it’s you!',
              style: h5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            PinCodeTextField(
              controller: otpTEController,
              length: 6,
              obscureText: false,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 55,
                fieldWidth: 50,
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
                return true;
              },
              appContext: context,
            ),
            sh20,
            Obx(
              () => forgotPasswordController.isLoading.value == true
                  ? CustomLoader(color: AppColors.white)
                  : CustomButton(
                      text: 'Confirm',
                      onPressed: () {
                        forgotPasswordController.verifyOtp(
                          email: email,
                          otp: otpTEController.text,
                        );
                      },
                      gradientColors: AppColors.gradientColor,
                    ),
            ),
            sh30,
            Obx(() {
              return forgotPasswordController.isResendLoading.value == true
                  ? CircularProgressIndicator(color: AppColors.textColorBlue,)
                  : forgotPasswordController.countdown.value > 0
                  ? Text(
                      'Resend code in ${forgotPasswordController.countdown.value}s',
                      style: h3,
                    )
                  : GestureDetector(
                      onTap: forgotPasswordController.countdown.value == 0
                          ? () {
                              forgotPasswordController.reSendOtp(email: email);
                            }
                          : null,
                      child:  Text(
                        'Resend code',
                        style: h3.copyWith(color: AppColors.textColorBlue),
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
