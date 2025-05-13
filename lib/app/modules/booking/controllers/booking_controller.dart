import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/booking/model/my_waitlist_model.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper_widget/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../../profile_and_settings/controllers/profile_and_settings_controller.dart';
import '../model/my_all_booking_model.dart';
import '../model/signle_payment_details_model.dart';

class BookingController extends GetxController {
  var isLoading = true.obs;
  var waitListList = <Result>[].obs;
  var singlePaymentDetails = Rxn<SPMData>();
  var allBookingList = <Datum>[].obs;
  var completedBookings = <Datum>[].obs;
  var confirmBooking = <Datum>[].obs;
  var upcomingBookings = <Datum>[].obs;

  final ProfileAndSettingsController profileAndSettingsController =
  Get.put(ProfileAndSettingsController());

  @override
  void onInit() {
    super.onInit();
    fetchWaitlist(null);
  }


  void onSearchQueryChangedWaitlist(String waitlistQuery) {
    fetchWaitlist(waitlistQuery);
  }

  void onSearchQueryChangedAllMyBooking(String bookingQuery) {
    fetchAllBooking(bookingQuery);
  }

  Future<void> fetchWaitlist(String? waitlistQuery) async {
    try {
      isLoading(true);
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var response = await BaseClient.getRequest(
        api: Api.getMyWaitlist(waitlistQuery ?? ''),
        headers: headers,
      );

      var responseBody = await BaseClient.handleResponse(response);
      MyWaitlistModel waitlistModel = MyWaitlistModel.fromJson(responseBody);
      waitListList.value = waitlistModel.data!.data; // Update waitlist
      update();
    } catch (e) {
      debugPrint("Error fetching waitlist: $e");
    } finally {
      isLoading(false);
    }
  }

  // Future<void> getSinglePaymentByBookingId(String bookingId) async {
  //   try {
  //     isLoading(true);
  //     String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
  //     var headers = {
  //       'Authorization': accessToken,
  //       'Content-Type': 'application/json',
  //     };
  //
  //     var response = await BaseClient.getRequest(
  //       api: Api.singlePaymentByBookingId(bookingId),
  //       headers: headers,
  //     );
  //
  //     var responseBody = await BaseClient.handleResponse(response);
  //     SinglePaymentDetailsModel singlePaymentDetailsModel =
  //         SinglePaymentDetailsModel.fromJson(responseBody);
  //     singlePaymentDetails.value = singlePaymentDetailsModel.data; // Update
  //     update();
  //   } catch (e) {
  //     debugPrint("Error fetching single payment: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  Future<void> removeWaitlist(String id) async {
    try {
      isLoading(true);

      var response = await BaseClient.deleteRequest(
        api: Api.removeWaitlist(id),
      );

      var responseBody = await BaseClient.handleResponse(response);

      if (responseBody['success'] == true) {
        debugPrint("Waitlist remove successfully: ${responseBody['message']}");
        await fetchWaitlist('');
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
  Future<void> fetchAllBooking(String? bookingQuery) async {
    try {
      isLoading(true);
      String accessToken = LocalStorage.getData(key: AppConstant.accessToken);
      var headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      var response = await BaseClient.getRequest(
        api: Api.myBookings(bookingQuery ?? ''),
        headers: headers,
      );



      var responseBody = await BaseClient.handleResponse(response);
      MyAllBookingModel myAllBookingModel =
          MyAllBookingModel.fromJson(responseBody);
      allBookingList.value = myAllBookingModel.data; // Update confirmedList

      DateTime currentDate = DateTime.now();

      //Confirm booking: all date future, past and present
      confirmBooking.value = allBookingList
          .where((booking) => booking.status?.toLowerCase() == "confirmed")
          .toList();

      // Upcoming bookings: future date
      upcomingBookings.value = allBookingList
          .where((booking) =>
              booking.session?.startDate != null &&
              booking.session!.startDate!.isAfter(currentDate) &&
              booking.status?.toLowerCase() == 'confirmed')
          .toList();

      // Completed bookings: includes both canceled and past confirmed bookings
      completedBookings.value = allBookingList.where((booking) {
        // Include canceled bookings
        if (booking.status?.toLowerCase() == "cancelled") {
          return true;
        }

        // Check for completed confirmed bookings
        if (booking.status?.toLowerCase() != "confirmed" ||
            booking.session?.startDate == null ||
            booking.session?.duration == null) {
          return false;
        }

        // Calculate end date by adding duration to start date
        DateTime endDate = booking.session!.startDate!
            .add(Duration(minutes: booking.session!.duration!));

        return endDate.isBefore(currentDate);
      }).toList();
      update();
    } catch (e) {
      debugPrint("Error fetching my booking: $e");
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
        //String bookingId = LocalStorage.getData(key: AppConstant.bookingId);
        //await getSinglePaymentByBookingId(bookingId);
        // await refundBooking(
        //   paymentIntendId:
        //       singlePaymentDetails.value?.paymentIntentId.toString() ?? '',
        //   amount: singlePaymentDetails.value?.amount.toString() ?? '',
        // );

        await fetchAllBooking('');
        profileAndSettingsController.getMyProfile();
        isLoading(false);
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

  // Future<bool> refundBooking(
  //     {required String paymentIntendId, required String amount}) async {
  //   try {
  //     isLoading(true);
  //
  //     var body = {"intendId": paymentIntendId, "amount": amount};
  //
  //     var response = await BaseClient.patchRequest(
  //       api: Api.refundPayment,
  //       body: jsonEncode(body),
  //     );
  //
  //     var responseBody = await BaseClient.handleResponse(response);
  //
  //     if (responseBody['success'] == true) {
  //       debugPrint("Refund successfully: ${responseBody['message']}");
  //       await fetchAllBooking('');
  //       return true;
  //     } else {
  //       debugPrint("Failed to Refund: ${responseBody['message']}");
  //       return false;
  //     }
  //   } catch (e) {
  //     debugPrint("Error Refund: $e");
  //     return false;
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}
