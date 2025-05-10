import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/membership/model/membership_model.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../../common/widgets/custom_snackbar.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../../payment/controllers/payment_controller.dart';
import '../../profile_and_settings/controllers/profile_and_settings_controller.dart';

class MembershipController extends GetxController {
  var isLoading = false.obs;
  var membershipData = <Datum>[].obs;
  final profileAndSettingsController = Get.put(ProfileAndSettingsController());
  final paymentController = Get.put(PaymentController());

  @override
  void onInit() {
    super.onInit();
    getPackages();
  }

  Future<void> getPackages() async {
    try {
      isLoading.value = true;
      String apiUrl = Api.membershipPackages;

      debugPrint("Fetching Membership Data...");
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Content-Type': "application/json",
        "Authorization": accessToken,
      };

      var response = await BaseClient.getRequest(api: apiUrl, headers: headers);

      if (response.statusCode == 200) {
        var jsonResponse = await BaseClient.handleResponse(response);
        MembershipModel membershipModel = MembershipModel.fromJson(jsonResponse);

        if (membershipModel.data.isNotEmpty) {
          membershipData.assignAll(membershipModel.data);
        } else {
          kSnackBar(
            message: "No membership data available",
            bgColor: AppColors.orange,
          );
        }
      } else {
        kSnackBar(
          message: "Failed to load membership data",
          bgColor: AppColors.orange,
        );
      }
    } catch (e) {
      debugPrint("Error getting membership: $e");
      kSnackBar(
        message: "Error getting membership: $e",
        bgColor: AppColors.orange,
      );
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
          paymentController.createPaymentSession(reference: subsId, modelType: 'Subscription');

          debugPrint(';;;;;;;;;;;;;;;;;; $subsId ;;;;;;;;;;;;;;;;;;;');
        } else {
          debugPrint('Failed to retrieve Order ID from LocalStorage');
        }
      }
    } catch (e) {
      debugPrint("subscription failed: $e");
    } finally {
      isLoading.value = false;
    }
  }

}