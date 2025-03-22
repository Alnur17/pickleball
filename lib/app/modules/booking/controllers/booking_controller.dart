import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/booking/model/my_waitlist_model.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';

class BookingController extends GetxController {
  var isLoading = true.obs;
  var waitListList = <Result>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchWaitlist();
  }

  Future<void> fetchWaitlist() async {
    try {
      isLoading(true);
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var response = await BaseClient.getRequest(
        api: Api.getMyWaitlist,
        headers: headers,
      );

      var responseBody = await BaseClient.handleResponse(response);
      MyWaitlistModel waitlistModel = MyWaitlistModel.fromJson(responseBody);
      waitListList.value = waitlistModel.data!.result; // Update waitlist
      update();
    } catch (e) {
      debugPrint("Error fetching waitlist: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> removeWaitlist(String id) async {
    try {
      isLoading(true);

      var response = await BaseClient.deleteRequest(
        api: Api.removeWaitlist(id),
      );

      var responseBody = await BaseClient.handleResponse(response);

      if (responseBody['success'] == true &&
          responseBody['statusCode'] == 200) {
        debugPrint("Waitlist created successfully: ${responseBody['message']}");
        await fetchWaitlist();
      } else {
        debugPrint("Failed to create waitlist: ${responseBody['message']}");
      }
    } catch (e) {
      debugPrint('Failed to remove waitlist $e');
    } finally {
      isLoading(false);
    }
  }
}

//
// ///
// Future<void> fetchConfirmedBooking() async {
//   try {
//     isLoading(true);
//     String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
//     var headers = {
//       'Authorization': accessToken,
//       'Content-Type': 'application/json',
//     };
//
//     var response = await BaseClient.getRequest(
//       api: Api.myBookings,
//       headers: headers,
//     );
//
//     var responseBody = await BaseClient.handleResponse(response);
//     ConfirmedBookingModel confirmedModel = ConfirmedBookingModel.fromJson(responseBody);
//     confirmedList.value = confirmedModel.data; // Update confirmedList
//     update();
//   } catch (e) {
//     debugPrint("Error fetching confirmed booking: $e");
//   } finally {
//     isLoading(false);
//   }
// }
