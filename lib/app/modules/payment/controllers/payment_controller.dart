import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pickleball/app/modules/my_search/controllers/my_search_controller.dart';
import 'package:pickleball/app/modules/payment/views/payment_confirmation_view.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../../common/widgets/custom_snackbar.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/payment_confirm_model.dart';
import '../views/payment_view.dart';

class PaymentController extends GetxController {
  var isLoading = false.obs;
  var confirmPaymentData = <Data>[].obs;

  final MySearchController mySearchController = Get.find();

  Future<void> createPaymentSession({
    required String reference,
  }) async {
    isLoading.value = true;

    String token = LocalStorage.getData(key: AppConstant.accessToken);

    var decodedToken = JwtDecoder.decode(token);

    String? id = decodedToken['_id']?.toString();

    var headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    var map = {"modelType": "Booking", "account": id, "reference": reference};

    dynamic responseBody = await BaseClient.handleResponse(
      await BaseClient.postRequest(
        api: Api.createPayment,
        body: jsonEncode(map),
        headers: headers,
      ),
    );

    if (responseBody != null) {
      Get.to(() => PaymentView(paymentUrl: responseBody["data"]));
      isLoading.value = false;
    } else {
      Get.snackbar("Error", "Failed to create payment session");
    }
  }

  Future<void> paymentResults({required String paymentLink}) async {
    try {
      isLoading.value = true;

      debugPrint("Fetching Profile Data...");

      var headers = {
        'Content-Type': "application/json",
      };

      var response =
          await BaseClient.getRequest(api: paymentLink, headers: headers);

      var responseBody = await BaseClient.handleResponse(response);

      if (responseBody['success'] = true) {
       await confirmPayment(sessionsId: mySearchController.sessionsDetails.value?.id ?? '', paymentId: '');
      } else {
        debugPrint("Error on Payment Result: $responseBody['message'] ");
      }
    } catch (e) {
      debugPrint("Error on Payment Result: $e");
      kSnackBar(
        message: "Error on Payment Result: $e",
        bgColor: AppColors.orange,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> confirmPayment(
      {required String sessionsId, required String paymentId})
  async {
    try {
      isLoading.value = true;

      String token = LocalStorage.getData(key: AppConstant.accessToken);

      var headers = {
        'Authorization': token,
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.confirmPayment(sessionsId, paymentId),
          headers: headers,
        ),
      );

      PaymentConfirmModel paymentConfirmModel =
          PaymentConfirmModel.fromJson(responseBody);
      if (paymentConfirmModel.data != null) {
        confirmPaymentData.value = [paymentConfirmModel.data!];
      }
      Get.to(() => PaymentConfirmationView());
      //Get.to(() => PaymentView(paymentUrl: responseBody["data"]));
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error", "Failed to create payment session $e");
    }
  }
}
