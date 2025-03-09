import 'dart:convert'; // For json.encode
import 'package:http/http.dart' as http; // For HTTP requests
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pickleball/app/data/api.dart';
import 'package:pickleball/app/modules/dashboard/views/dashboard_view.dart';
import 'package:pickleball/common/app_constant/app_constant.dart';
import 'package:pickleball/common/helper_widget/local_store.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/widgets/custom_snackbar.dart';
import '../../../data/base_client.dart';
import '../views/verify_your_email_view.dart';

class SignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final isLoading = false.obs;

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    contactNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  // Register user using http.MultipartRequest
  Future<void> registerUser() async {
    final Uri url = Uri.parse(Api.register);
    final request = http.MultipartRequest('POST', url);

    request.fields['data'] = json.encode({
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'contactNumber': contactNumberController.text,
    });

    try {
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

        print(
            '=======> OTP Token saved: ${LocalStorage.getData(key: AppConstant.otpToken)} <====');

        Get.offAll(() => VerifyYourEmailView(email: emailController.text,));
      } else {
        debugPrint(
            '===========================> Failed to register. Status code: ${response.statusCode} <===========================');
        Get.snackbar('Error', 'Registration failed. Please try again.');
      }
    } catch (e) {
      debugPrint(
          '=====================> Error: $e <===========================');
      Get.snackbar('Error', 'An error occurred. Please try again.');
    }
  }

  Future emailVerify({
    required String otp,
  }) async {
    try {

      String otpToken = LocalStorage.getData(key: AppConstant.otpToken);

      debugPrint("============================> $otpToken <==================================");

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
          Get.offAll(() => DashboardView());
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
