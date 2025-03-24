class Api {
  /// base url

  static const baseUrl = "http://192.168.10.144:5000/api/v1";

  ///auth
  static const register = "$baseUrl/users/register"; //done
  static const login = "$baseUrl/auth/login"; //done
  static const forgotPassword = "$baseUrl/auth/forget-password"; //done
  static const otpVerify = "$baseUrl/otp/verify-otp"; //done
  static const reSendOtp = "$baseUrl/otp/resend-otp"; // done
  static const resetPassword = "$baseUrl/auth/reset-password"; //done
  static const changePassword = "$baseUrl/auth/change-password"; // done

  ///Sessions Data
  static sessions(String? query) => query?.isNotEmpty ?? false
      ? "$baseUrl/sessions?searchTerm=$query"
      : "$baseUrl/sessions"; // If query is null or empty, omit searchTerm //done

  ///Trainers Data
  static trainers(String? query) {
    // Add the searchTerm parameter only if the query is not null or empty
    return query?.isNotEmpty ?? false
        ? "$baseUrl/trainers?searchTerm=$query"
        : "$baseUrl/trainers"; // If query is null or empty, omit searchTerm
  } //done

  /// get session details by id
  static getSingleSession(String id) => "$baseUrl/sessions/$id"; //done

  /// get trainer details by id
  static getSingleTrainer(String id) => "$baseUrl/trainers/$id"; //done

  ///showBookMarked
  static const myBookings = "$baseUrl/bookings/my-bookings"; //done

  static const addBookings = "$baseUrl/bookings"; // done

  static  getSingleBookingById(String id) => "$baseUrl/bookings/$id"; // done

  static  cancelBooking(String id) => "$baseUrl/bookings/canceled/$id"; // done

  /// WaitList
  static const addMyWaitlist = "$baseUrl/waitLists"; // done

  static const getMyWaitlist = "$baseUrl/waitLists/my-waitlist"; //done

  static removeWaitlist(String id) => "$baseUrl/waitLists/$id"; //done

  /// All slot
  static timeSlot(String id) => "$baseUrl/session-slots/session/$id"; // done

  ///profile
  static const String myProfile = "$baseUrl/users/my-profile"; //done

  static const String editMyProfile = "$baseUrl/users/update-my-profile"; //done

  static const String conditionsPage = "$baseUrl/settings"; //done

  static String subscription(String planType, String email) =>
      "$baseUrl/subscriptions/create-payment-session?subscription_type=$planType&email=$email"; //
}
