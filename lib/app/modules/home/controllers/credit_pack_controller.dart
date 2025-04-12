import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/home/model/credit_model.dart';

import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';

class CreditPackController extends GetxController {
  var selectedIndex = 0.obs;
  var isLoading = false.obs;
  var creditList = <Datum>[].obs;


  void selectItem(int index) {
    selectedIndex.value = index;
  }


  Future<void> fetchTrainers(String? trainerQuery) async {
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
      creditList.value = creditModel.data; // Update trainers list
      update();
    } catch (e) {
      debugPrint("Error fetching trainers: $e");
    } finally {
      isLoading.value = false;
    }
  }

}