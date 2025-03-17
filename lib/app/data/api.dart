class Api {
  /// base url

  static const baseUrl = "http://192.168.10.144:5000/api/v1";

  ///auth
  static const register = "$baseUrl/users/register"; //done
  static const login = "$baseUrl/auth/login"; //done
  static const forgotPassword = "$baseUrl/auth/forget-password"; //done
  static const otpVerify = "$baseUrl/otp/verify-otp"; //done
  static const reSendOtp = "$baseUrl/otp/resend-otp"; //
  static const resetPassword = "$baseUrl/auth/reset-password"; //done
  static const changePassword = "$baseUrl/auth/change-password"; //

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
  static getSingleSession(String id) => "$baseUrl/sessions/$id";

  /// get session details by id
  static getSingleTrainer(String id) => "$baseUrl/trainers/$id";

  ///showBookMarked
  static const myBookings = "$baseUrl/bookings/my-bookings"; //

  ///Create BookMarked
  static const myWaitlist = "$baseUrl/waitLists/my-waitlist"; //done

  static removeBookMark(String id) => "$baseUrl/college-bookmarks/$id"; //

  /// upload video
  static const uploadVideo = "$baseUrl/videos"; //

  ///video data
  static const videoData = "$baseUrl/videos"; //

  ///video delete by id
  static String deleteVideo({required String id}) => "$baseUrl/videos/$id"; //

  static String updateVideo({required String id}) => "$baseUrl/videos/$id"; //

  static const String receivedEmail = "$baseUrl/emails/received";

  static const String sentEmail = "$baseUrl/emails/sent";

  static const String writeEmail = "$baseUrl/emails"; //

  ///profile
  static const String myProfile = "$baseUrl/users/my-profile"; //

  static const String editMyProfile = "$baseUrl/users/update-my-profile"; //

  static const String deleteProfile = "$baseUrl/athletes"; //

  static const String conditionsPage = "$baseUrl/settings"; //done

  static String subscription(String planType, String email) =>
      "$baseUrl/subscriptions/create-payment-session?subscription_type=$planType&email=$email"; //
}
