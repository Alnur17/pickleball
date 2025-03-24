import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/booking/model/my_waitlist_model.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/my_all_booking_model.dart';

class BookingController extends GetxController {
  var isLoading = true.obs;
  var waitListList = <Result>[].obs;
  var allBookingList = <Datum>[].obs;
  var completedBookings = <Datum>[].obs;
  var confirmBooking = <Datum>[].obs;
  var upcomingBookings = <Datum>[].obs;

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

      if (responseBody['success'] == true ||
          responseBody['statusCode'] == 200) {
        debugPrint("Waitlist remove successfully: ${responseBody['message']}");
        await fetchWaitlist();
      } else {
        debugPrint("Failed to remove waitlist: ${responseBody['message']}");
      }
    } catch (e) {
      debugPrint('Failed to remove waitlist $e');
    } finally {
      isLoading(false);
    }
  }

  ///
  Future<void> fetchAllBooking() async {
    try {
      isLoading(true);
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var response = await BaseClient.getRequest(
        api: Api.myBookings,
        headers: headers,
      );

      var responseBody = await BaseClient.handleResponse(response);
      MyAllBookingModel myAllBookingModel =
          MyAllBookingModel.fromJson(responseBody);
      allBookingList.value = myAllBookingModel.data; // Update confirmedList

      DateTime currentDate = DateTime.now();

      confirmBooking.value = allBookingList
          .where((booking) => booking.status?.toLowerCase() == "confirmed")
          .toList();

      // Completed bookings
      completedBookings.value = allBookingList;
      // .where((booking) =>
      //     booking.session!.startDate != null &&
      //         booking.session!.startDate!.isBefore(currentDate)).toList();

      // && booking.status?.toLowerCase() == "confirmed")

      // Upcoming bookings: future date
      upcomingBookings.value = allBookingList
          .where((booking) =>
              booking.session?.startDate != null &&
              booking.session!.startDate!.isAfter(currentDate))
          .toList();
      update();
      isLoading(false);
    } catch (e) {
      debugPrint("Error fetching my booking: $e");
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  Future<bool> cancelBooking(String id) async {
    try {
      isLoading(true);

      var response = await BaseClient.patchRequest(
        api: Api.cancelBooking(id),
      );

      var responseBody = await BaseClient.handleResponse(response);

      if (responseBody['success'] == true) {
        debugPrint("Bookings cancel successfully: ${responseBody['message']}");
        await fetchAllBooking();
        return true;
      } else {
        debugPrint("Failed to cancel bookings: ${responseBody['message']}");
        return false;
      }
    } catch (e) {
      debugPrint("Error cancel bookings: $e");
      return false;
    } finally {
      isLoading(false);
    }
  }
}
