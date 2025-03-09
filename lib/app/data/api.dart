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

  ///College Data
  static const schoolData = "$baseUrl/schools"; //

  ///showBookMarked
  static const bookMarked = "$baseUrl/bookmarks"; //

  ///Create BookMarked
  static const addBookMark = "$baseUrl/bookmarks"; //

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

  static const String conditionsPage = "$baseUrl/settings"; //

  static String subscription(String planType, String email) =>
      "$baseUrl/subscriptions/create-payment-session?subscription_type=$planType&email=$email"; //
}
