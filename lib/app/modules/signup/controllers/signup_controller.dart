import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pickleball/app/data/api.dart';
import 'package:pickleball/app/modules/membership/views/membership_view.dart';
import 'package:pickleball/common/app_constant/app_constant.dart';
import 'package:pickleball/common/helper_widget/local_store.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/widgets/custom_snackbar.dart';
import '../../../data/base_client.dart';
import '../views/verify_your_email_view.dart';

class SignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;


  var isPasswordVisible = false.obs;
  var isCheckboxVisible = false.obs;

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void toggleCheckboxVisibility() {
    isCheckboxVisible.toggle();

  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    contactNumberController.dispose();
    addressController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  // Register user using http.MultipartRequest
  Future<void> registerUser() async {
    final Uri url = Uri.parse(Api.register);
    final request = http.MultipartRequest('POST', url);

    if (passwordController.text.trim().length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters');
      return;
    }

    if (contactNumberController.text.trim().length < 11 || contactNumberController.text.trim().length < 10 ) {
      Get.snackbar('Error', 'Contact number must be at least 10/11 characters');
      return;
    }

    request.fields['data'] = json.encode({
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'contactNumber': contactNumberController.text,
      'address': addressController.text,
    });

    try {
      isLoading(true);
      // Send the request and get the response
      final response = await request.send();

      if (response.statusCode >= 200 && response.statusCode <= 210) {
        debugPrint(
            '===========================> User registered successfully! <===========================');

        // Decode the response to get the OTP token
        final responseBody = await response.stream.bytesToString();
        final Map<String, dynamic> responseJson = json.decode(responseBody);
        String otpToken = responseJson['data']['otpToken']['token'].toString();

        // Save OTP token using LocalStorage
        LocalStorage.saveData(key: AppConstant.otpToken, data: otpToken);

        debugPrint(
            '=======> OTP Token saved: ${LocalStorage.getData(key: AppConstant.otpToken)} <====');

        Get.offAll(() => VerifyYourEmailView(
              email: emailController.text,
            ));
      } else if (response.statusCode == 403) {
        Get.snackbar(
          'Failed',
          'User already exists with this email.',
          backgroundColor: AppColors.red,
          colorText: AppColors.white,
        );
      }
      isLoading(false);
    } catch (e) {
      debugPrint(
          '=====================> Error: $e <===========================');
      Get.snackbar('Error', 'An error occurred. Please try again.');
    } finally {
      isLoading(false);
    }
  }

  Future emailVerify({
    required String otp,
  }) async {
    try {
      String otpToken = LocalStorage.getData(key: AppConstant.otpToken);

      debugPrint(
          "============================> $otpToken <==================================");

      isLoading(true);
      var map = {
        'otp': otp,
      };

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
        bool success = responseBody['success'];
        String accessToken = responseBody['data']['accessToken'].toString();

        LocalStorage.saveData(key: AppConstant.accessToken, data: accessToken);

        kSnackBar(message: message, bgColor: AppColors.green);

        if (success == true) {
          Get.offAll(() => MembershipView());
        } else {
          kSnackBar(message: 'Failed', bgColor: AppColors.red);
        }

        isLoading(false);
      } else {
        throw 'Email verification in Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
    } finally {
      isLoading(false);
    }
  }
}
