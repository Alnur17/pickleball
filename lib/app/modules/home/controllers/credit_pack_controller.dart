import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/home/model/credit_model.dart';
import 'package:pickleball/app/modules/payment/controllers/payment_controller.dart';
import 'package:pickleball/app/modules/profile_and_settings/controllers/profile_and_settings_controller.dart';

import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';

class CreditPackController extends GetxController {
  var selectedIndex = 0.obs;
  var isLoading = false.obs;
  var creditList = <Datum>[].obs;
  final profileAndSettingsController = Get.put(ProfileAndSettingsController());
  final paymentController = Get.put(PaymentController());

  @override
  void onInit() {
    super.onInit();
    getCreditPacks();
  }

  void selectItem(int index) {
    selectedIndex.value = index;
  }

  Future<void> getCreditPacks() async {
    try {
      isLoading.value = true;
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var response = await BaseClient.getRequest(
        api: Api.creditPackages,
        headers: headers,
      );

      var responseBody = await BaseClient.handleResponse(response);
      CreditModel creditModel = CreditModel.fromJson(responseBody);
      creditList.value = creditModel.data;
      if (creditList.isNotEmpty) {
        selectedIndex.value = 0;
      }
    } catch (e) {
      debugPrint("Error fetching package: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createSubscription({
    required String packageId,
  }) async {
    try {
      isLoading.value = true;
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      // var decodedToken = JwtDecoder.decode(accessToken);
      // var userId = decodedToken['_id'].toString();
      final userId = profileAndSettingsController.myProfileData.value?.id ?? '';
      debugPrint(':::::::::::::: $userId ::::::::::::::::');
      var body = {
        'user': userId,
        'package': packageId,
      };
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      debugPrint(';;;;;;;;;;;;;;;;;;; $headers ::::::::::::::::');

      var response = await BaseClient.postRequest(
        api: Api.createSubscription,
        body: jsonEncode(body),
        headers: headers,
      );

      var responseBody = await BaseClient.handleResponse(response);
      if (responseBody['success'] = true) {
        String subscriptionId = responseBody['data']['_id'].toString();
        LocalStorage.saveData(key: AppConstant.subscriptionId, data: subscriptionId);
        String? subsId = LocalStorage.getData(key: AppConstant.subscriptionId);
        if (subsId != null) {
          paymentController.createPaymentSession(reference: subsId);
          debugPrint(';;;;;;;;;;;;;;;;;; $subsId ;;;;;;;;;;;;;;;;;;;');
        } else {
          debugPrint('Failed to retrieve subscription ID from LocalStorage');
        }
      }
    } catch (e) {
      debugPrint("subscription failed: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
