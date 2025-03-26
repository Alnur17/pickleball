import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pickleball/app/modules/my_search/controllers/my_search_controller.dart';
import 'package:pickleball/app/modules/payment/model/payment_details_model.dart';
import 'package:pickleball/app/modules/payment/views/payment_confirmation_view.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../../common/widgets/custom_snackbar.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../views/payment_view.dart';

class PaymentController extends GetxController {
  var isLoading = false.obs;
  var paymentDetailsData = Rxn<Data>();

  final MySearchController mySearchController = Get.put(MySearchController());

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
        var paymentId = responseBody['data']['_id'].toString();

        LocalStorage.saveData(key: AppConstant.paymentId, data: paymentId);
        String id = LocalStorage.getData(key: AppConstant.paymentId);
        debugPrint('::::::::::::::::: $id :::::::::::::::::');
        Get.to(() => PaymentConfirmationView());
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

  Future<void> paymentDetails() async {
    try {
      isLoading.value = true;

      String token = LocalStorage.getData(key: AppConstant.accessToken);
      String paymentId = LocalStorage.getData(key: AppConstant.paymentId);

      var headers = {
        'Authorization': token,
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
          api: Api.paymentDetails(paymentId),
          headers: headers,
        ),
      );
      if (responseBody['success'] = true) {
        String message = responseBody['message'];
        PaymentDetailsModel paymentDetailsModel =
            PaymentDetailsModel.fromJson(responseBody);
        paymentDetailsData.value = paymentDetailsModel.data;
        debugPrint(':::::::::::::: $message ::::::::::::::::::');
        debugPrint(':::::::::::::: $responseBody ::::::::::::::::::');
      }
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error", "Failed to create payment session $e");
    }
  }
}
