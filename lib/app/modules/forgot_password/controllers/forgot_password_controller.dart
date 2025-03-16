import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/forgot_password/views/reset_password_view.dart';
import 'package:pickleball/app/modules/login/views/login_view.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../../common/widgets/custom_snackbar.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../views/otp_verification_view.dart';

class ForgotPasswordController extends GetxController {
  var isLoading = false.obs;

  Rx<int> countdown = 59.obs;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  // Countdown timer logic
  void startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        timer.cancel();
      }
    });
  }

  ///forgot Password Controller
  Future forgotPassword({
    required String email,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['email'] = email;

      var headers = {
        'Content-Type': 'application/json',
      };
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
            api: Api.forgotPassword, body: jsonEncode(map), headers: headers),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        //bool success = responseBody['success'];
        String verifyToken = responseBody['data']['verifyToken'].toString();

        LocalStorage.saveData(key: AppConstant.verifyToken, data: verifyToken);

        print(
            '=======> Verify Token saved: ${LocalStorage.getData(key: AppConstant.verifyToken)} <====');

        Get.to(
            () => OtpVerificationView(
                  email: email,
                ),
            transition: Transition.fade);

        isLoading(false);
      } else {
        throw 'forgot in Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Otp verification
  Future verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      String otpToken = LocalStorage.getData(key: AppConstant.verifyToken);

      debugPrint(
          "============================> $otpToken <==================================");

      isLoading(true);
      var map = <String, dynamic>{};
      map['email'] = email;
      map['otp'] = otp;

      var headers = {
        'Authorization': otpToken,
        'Content-Type': 'application/json',
      };
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
            api: Api.otpVerify, body: jsonEncode(map), headers: headers),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);

        // bool success = responseBody['success'];
        String accessToken = responseBody['data']['accessToken'].toString();

        LocalStorage.saveData(key: AppConstant.accessToken, data: accessToken);

        Get.to(() => ResetPasswordView(email: email));

        isLoading(false);
      } else {
        throw 'verify otp in Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
    } finally {
      isLoading(false);
    }
  }


  /// Resend Otp
  Future reSendOtp({
    required String email,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['email'] = email;

      var headers = {
        'Content-Type': 'application/json',
      };
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
            api: Api.reSendOtp, body: jsonEncode(map), headers: headers),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);

        // bool success = responseBody['success'];
        String accessToken = responseBody['data']['token'].toString();

        LocalStorage.saveData(key: AppConstant.accessToken, data: accessToken);

        isLoading(false);
      } else {
        throw 'Fail to resend Otp';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// resetPassword
  Future resetPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      String otpToken = LocalStorage.getData(key: AppConstant.accessToken);

      debugPrint(
          "============================> $otpToken <==================================");

      isLoading(true);
      var map = <String, dynamic>{};
      map['email'] = email;
      map['newPassword'] = newPassword;
      map['confirmPassword'] = confirmPassword;

      var headers = {
        'Authorization': otpToken,
        'Content-Type': 'application/json',
      };

      print(headers);
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
            api: Api.resetPassword, body: jsonEncode(map), headers: headers),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);

        // bool success = responseBody['success'];

        Get.offAll(() => LoginView());

        isLoading(false);
      } else {
        throw 'Reset password Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
    } finally {
      isLoading(false);
    }
  }
}
