import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/home/model/trainers_model.dart';

import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/course_sessions_model.dart';

class HomeController extends GetxController {
  var courseSessions = <Datum>[].obs;
  var trainerList = <DatumT>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourseSessions();
    fetchTrainers();
  }

  Future<void> fetchCourseSessions() async {
    try {
      isLoading(true);
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var response = await BaseClient.getRequest(
        api: Api.sessions,
        headers: headers,
      );

      var responseBody = await BaseClient.handleResponse(response);
      debugPrint(
          "==================================> Response: $responseBody <================================");
      CourseSessionsModel courseSessionsModel =
          CourseSessionsModel.fromJson(responseBody);
      courseSessions.value =
          courseSessionsModel.data; // Update course sessions list
    } catch (e) {
      debugPrint("Error fetching course sessions: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchTrainers() async {
    try {
      isLoading(true);
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var response = await BaseClient.getRequest(
        api: Api.trainers,
        headers: headers,
      );

      var responseBody = await BaseClient.handleResponse(response);
      debugPrint(
          "========================>Trainer Response: $responseBody <=====================");
      TrainersModel trainersModel = TrainersModel.fromJson(responseBody);
      trainerList.value = trainersModel.data; // Update course sessions list
    } catch (e) {
      debugPrint("Error fetching course sessions: $e");
    } finally {
      isLoading(false);
    }
  }
}
