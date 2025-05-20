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

  // Full original data fetched from API
  List<Result> _allWaitList = [];
  List<Datum> _allBookingList = [];

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
    fetchWaitlist();
  }

  void onSearchQueryChangedWaitlist(String waitlistQuery) {
    if (waitlistQuery.isEmpty) {
      waitListList.value = List.from(_allWaitList);
    } else {
      waitListList.value = _allWaitList
          .where((waitlist) =>
              (waitlist.session?.name // replace with real field(s)
                      ?.toLowerCase()
                      .contains(waitlistQuery.toLowerCase()) ??
                  false))
          .toList();
    }
  }

  void onSearchQueryChangedAllMyBooking(String bookingQuery) {
    if (bookingQuery.isEmpty) {
      allBookingList.value = List.from(_allBookingList);
      _updateBookingLists();
    } else {
      allBookingList.value = _allBookingList.where((booking) {
        final sessionName = booking.session?.name?.toLowerCase() ?? '';
        final coachName = booking.session?.coach?.name?.toLowerCase() ?? '';
        final query = bookingQuery.toLowerCase();
        return sessionName.contains(query) || coachName.contains(query);
      }).toList();
      _updateBookingLists();
    }
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

      _allWaitList = waitlistModel.data!.data;
      waitListList.value = List.from(_allWaitList);
      update();
    } catch (e) {
      debugPrint("Error fetching waitlist: $e");
    } finally {
      isLoading(false);
    }
  }

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

      _allBookingList = myAllBookingModel.data;
      allBookingList.value = List.from(_allBookingList);
      _updateBookingLists();

      update();
    } catch (e) {
      debugPrint("Error fetching my booking: $e");
    } finally {
      isLoading(false);
    }
  }

  void _updateBookingLists() {
    DateTime currentDate = DateTime.now();

    confirmBooking.value = allBookingList
        .where((booking) => booking.status?.toLowerCase() == "confirmed")
        .toList();

    upcomingBookings.value = allBookingList
        .where((booking) =>
            booking.session?.startDate != null &&
            booking.session!.startDate!.isAfter(currentDate) &&
            booking.status?.toLowerCase() == 'confirmed')
        .toList();

    completedBookings.value = allBookingList.where((booking) {
      if (booking.status?.toLowerCase() == "cancelled") {
        return true;
      }

      if (booking.status?.toLowerCase() != "confirmed" ||
          booking.session?.startDate == null ||
          booking.session?.duration == null) {
        return false;
      }

      DateTime endDate = booking.session!.startDate!
          .add(Duration(minutes: booking.session!.duration!));

      return endDate.isBefore(currentDate);
    }).toList();
  }

  Future<void> removeWaitlist(String id) async {
    try {
      isLoading(true);

      var response = await BaseClient.deleteRequest(
        api: Api.removeWaitlist(id),
      );

      var responseBody = await BaseClient.handleResponse(response);

      if (responseBody['success'] == true) {
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
}
