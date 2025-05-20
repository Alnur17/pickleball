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
  // Full original data fetched from API
  var _allCourseSessions = <Datum>[];
  var _allTrainerList = <DatumT>[];

  // Observable filtered lists used in UI
  var courseSessions = <Datum>[].obs;
  var trainerList = <DatumT>[].obs;
  var recommendedTrainerList = <RecommendedDatum>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCourseSessions();
    fetchTrainers();
    fetchRecommendedTrainers();
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
      CourseSessionsModel courseSessionsModel =
      CourseSessionsModel.fromJson(responseBody);

      _allCourseSessions = courseSessionsModel.data;
      courseSessions.value = List.from(_allCourseSessions); // Show all initially

      update();
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
      TrainersModel trainersModel = TrainersModel.fromJson(responseBody);

      _allTrainerList = trainersModel.data;
      trainerList.value = List.from(_allTrainerList); // Show all initially

      update();
    } catch (e) {
      debugPrint("Error fetching trainers: $e");
    } finally {
      isLoading(false);
    }
  }

  // Local search on courseSessions
  void onSearchQueryChangedSession(String query) {
    if (query.isEmpty) {
      courseSessions.value = List.from(_allCourseSessions);
    } else {
      courseSessions.value = _allCourseSessions
          .where((session) =>
      session.name?.toLowerCase().contains(query.toLowerCase()) == true ||
          (session.description != null &&
              session.description!.toLowerCase().contains(query.toLowerCase())))
          .toList();
    }
  }

  // Local search on trainerList
  void onSearchQueryChangedTrainer(String query) {
    if (query.isEmpty) {
      trainerList.value = List.from(_allTrainerList);
    } else {
      trainerList.value = _allTrainerList
          .where((trainer) =>
      trainer.name?.toLowerCase().contains(query.toLowerCase()) == true)
          .toList();
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

  // void onSearchQueryChangedSession(String sessionQuery) {
  //   fetchCourseSessions(sessionQuery);
  // }
  //
  // void onSearchQueryChangedTrainer(String trainerQuery) {
  //   fetchTrainers(trainerQuery);
  // }
}
