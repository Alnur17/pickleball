import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/home/model/recommended_trainers_model.dart';
import 'package:pickleball/app/modules/home/model/trainers_model.dart';

import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/course_sessions_model.dart';

class HomeController extends GetxController {
  var courseSessions = <Datum>[].obs;
  var trainerList = <DatumT>[].obs;
  var recommendedTrainerList = <RecommendedDatum>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourseSessions(null);
    fetchTrainers(null);
    fetchRecommendedTrainers();
  }

  Future<void> fetchCourseSessions(String? sessionQuery) async {
    try {
      isLoading(true);
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var response = await BaseClient.getRequest(
        api: Api.sessions(sessionQuery ?? ''),
        headers: headers,
      );

      var responseBody = await BaseClient.handleResponse(response);
      CourseSessionsModel courseSessionsModel =
          CourseSessionsModel.fromJson(responseBody);
      courseSessions.value =
          courseSessionsModel.data; // Update course sessions list
      update();
    } catch (e) {
      debugPrint("Error fetching course sessions: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchTrainers(String? trainerQuery) async {
    try {
      isLoading(true);
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var response = await BaseClient.getRequest(
        api: Api.trainers(trainerQuery ?? ''),
        headers: headers,
      );

      var responseBody = await BaseClient.handleResponse(response);
      TrainersModel trainersModel = TrainersModel.fromJson(responseBody);
      trainerList.value = trainersModel.data; // Update trainers list
      update();
    } catch (e) {
      debugPrint("Error fetching trainers: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchRecommendedTrainers() async {
    try {
      isLoading(true);
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var response = await BaseClient.getRequest(
        api: Api.recommendedTrainers,
        headers: headers,
      );

      var responseBody = await BaseClient.handleResponse(response);
      RecommendedTrainersModel recommendedTrainersModel = RecommendedTrainersModel.fromJson(responseBody);
      recommendedTrainerList.value = recommendedTrainersModel.data;
      update();
    } catch (e) {
      debugPrint("Error fetching recommended trainers: $e");
    } finally {
      isLoading(false);
    }
  }

  void onSearchQueryChangedSession(String sessionQuery) {
    fetchCourseSessions(sessionQuery);
  }

  void onSearchQueryChangedTrainer(String trainerQuery) {
    fetchTrainers(trainerQuery);
  }
}
