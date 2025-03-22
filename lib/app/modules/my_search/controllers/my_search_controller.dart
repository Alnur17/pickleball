import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/booking/controllers/booking_controller.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../../home/model/course_sessions_model.dart';
import '../../home/model/trainers_model.dart';
import '../model/time_slot_model.dart';

class MySearchController extends GetxController {
  var sessionsDetails = Rxn<Datum>(); // For single session
  var trainerDetails = Rxn<DatumT>(); // Changed to single trainer (not a list)
  var timeSlotList = <DatumSlot>[].obs;
  var isLoading = true.obs;
  var bookingController = Get.find<BookingController>();

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

      if (responseBody is Map<String, dynamic> &&
          responseBody["data"] != null) {
        sessionsDetails.value =
            Datum.fromJson(responseBody["data"] as Map<String, dynamic>);
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
      if (responseBody is Map<String, dynamic> &&
          responseBody["data"] != null) {
        trainerDetails.value =
            DatumT.fromJson(responseBody["data"] as Map<String, dynamic>);
      } else {
        // If the API returns a list, take the first item (adjust based on actual API response)
        TrainersModel trainersModel = TrainersModel.fromJson(responseBody);
        trainerDetails.value =
            trainersModel.data.isNotEmpty ? trainersModel.data[0] : null;
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


  Future<void> getTimeSlot(String id) async {
    try {
      isLoading(true);
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var response = await BaseClient.getRequest(
        api: Api.timeSlot(id),
        headers: headers,
      );

      var responseBody = await BaseClient.handleResponse(response);
      TimeSlotModel timeSlotModel = TimeSlotModel.fromJson(responseBody);
      timeSlotList.value = timeSlotModel.data; // Update timeSlot list
      update();
    } catch (e) {
      debugPrint("Error fetching time: $e");
    } finally {
      isLoading(false);
    }
  }


  Future<bool> addWaitlist(String userId, String sessionId) async {
    try {
      isLoading(true);

      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);

      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var body = {
        "user": userId,
        "session": sessionId,
      };

      var response = await BaseClient.postRequest(
          api: Api.addMyWaitlist, headers: headers, body: jsonEncode(body));

      var responseBody = await BaseClient.handleResponse(response);

      if (responseBody['success'] == true &&
          responseBody['statusCode'] == 201) {
        debugPrint("Waitlist created successfully: ${responseBody['message']}");
        // Optionally, refresh the waitlist after creating
        await bookingController.fetchWaitlist();
        return true;
      } else {
        debugPrint("Failed to create waitlist: ${responseBody['message']}");
        return false;
      }
    } catch (e) {
      debugPrint("Error creating waitlist: $e");
      return false;
    } finally {
      isLoading(false);
    }
  }
}
