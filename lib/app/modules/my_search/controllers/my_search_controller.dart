import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../../home/model/course_sessions_model.dart';
import '../../home/model/trainers_model.dart';

class MySearchController extends GetxController {
  var sessionsDetails = Rxn<Datum>(); // For single session
  var trainerDetails = Rxn<DatumT>(); // Changed to single trainer (not a list)
  var isLoading = true.obs;

  Future<void> fetchSessionsDetails(String id) async {
    try {
      isLoading(true);
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var response = await BaseClient.getRequest(
        api: Api.getSingleSession(id),
        headers: headers,
      );

      var responseBody = await BaseClient.handleResponse(response);
      debugPrint("Session API Response: $responseBody");

      if (responseBody is Map<String, dynamic> && responseBody["data"] != null) {
        sessionsDetails.value = Datum.fromJson(responseBody["data"] as Map<String, dynamic>);
      } else {
        throw Exception("Unexpected session response format");
      }
      update();
    } catch (e) {
      debugPrint("Error fetching course sessions: $e");
      sessionsDetails.value = null; // Clear data on error
      Get.snackbar('Error', 'Failed to load session details: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchTrainersDetails(String id) async {
    try {
      isLoading(true);
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var response = await BaseClient.getRequest(
        api: Api.getSingleTrainer(id),
        headers: headers,
      );

      var responseBody = await BaseClient.handleResponse(response);
      debugPrint("Trainer API Response: $responseBody");

      // Parse the response assuming "data" contains a single trainer object
      if (responseBody is Map<String, dynamic> && responseBody["data"] != null) {
        trainerDetails.value = DatumT.fromJson(responseBody["data"] as Map<String, dynamic>);
      } else {
        // If the API returns a list, take the first item (adjust based on actual API response)
        TrainersModel trainersModel = TrainersModel.fromJson(responseBody);
        trainerDetails.value = trainersModel.data.isNotEmpty ? trainersModel.data[0] : null;
      }
      update();
    } catch (e) {
      debugPrint("Error fetching trainers: $e");
      trainerDetails.value = null; // Clear data on error
      Get.snackbar('Error', 'Failed to load trainer details: $e');
    } finally {
      isLoading(false);
    }
  }
}