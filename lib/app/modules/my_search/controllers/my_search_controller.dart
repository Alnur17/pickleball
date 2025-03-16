import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../../home/model/course_sessions_model.dart';

class MySearchController extends GetxController {
  var sessionsDetails = Rxn<Datum>(); // Use Rxn for a single nullable Datum
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
      debugPrint("API Response: $responseBody");

      // Parse the response assuming "data" contains a single object
      if (responseBody is Map<String, dynamic> && responseBody["data"] != null) {
        sessionsDetails.value = Datum.fromJson(responseBody["data"] as Map<String, dynamic>);
      } else {
        throw Exception("Unexpected response format");
      }
      update();
    } catch (e) {
      debugPrint("Error fetching course sessions: $e");
    } finally {
      isLoading(false);
    }
  }
}