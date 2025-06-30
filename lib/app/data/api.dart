class Api {
  /// base url

  static const baseUrl = "https://api.thirdshotslot.co.uk/api/v1";
  static const socket = "https://socket.thirdshotslot.co.uk/";


  ///auth
  static const register = "$baseUrl/users/register"; //done
  static const login = "$baseUrl/auth/login"; //done
  static const forgotPassword = "$baseUrl/auth/forget-password"; //done
  static const otpVerify = "$baseUrl/otp/verify-otp"; //done
  static const reSendOtp = "$baseUrl/otp/resend-otp"; // done
  static const resetPassword = "$baseUrl/auth/reset-password"; //done
  static const changePassword = "$baseUrl/auth/change-password"; // done

  ///Sessions Data
  static const sessions = "$baseUrl/sessions"; //done

  ///Trainers Data
  // static trainers(String? query) {
  //   return query?.isNotEmpty ?? false
  //       ? "$baseUrl/trainers?searchTerm=$query"
  //       : "$baseUrl/trainers";
  // } //done
   static const trainers = "$baseUrl/trainers";//done

   static const recommendedTrainers = "$baseUrl/trainers/recommended"; //done

  /// get session details by id
  static getSingleSession(String id) => "$baseUrl/sessions/$id"; //done

  /// get trainer details by id
  static getSingleTrainer(String id) => "$baseUrl/trainers/$id"; //done

  ///showBookMarked
  static const myBookings= "$baseUrl/bookings/my-bookings"; //done

  static const addBookings = "$baseUrl/bookings"; // done

  static getSingleBookingById(String id) => "$baseUrl/bookings/$id"; // done

  static cancelBooking(String id) => "$baseUrl/bookings/canceled/$id"; // done

  /// WaitList
  static const addMyWaitlist = "$baseUrl/waitLists"; // done

  static const getMyWaitlist = "$baseUrl/waitLists/my-waitlist"; //done

  static removeWaitlist(String id) => "$baseUrl/waitLists/$id"; //done

  static removeWaitlistBySessionId(String sessionId) =>
      "$baseUrl/waitLists/session/$sessionId"; //done

  /// All slot
  static timeSlot(String id) => "$baseUrl/session-slots/session/$id"; // done

  ///profile
  static const String myProfile = "$baseUrl/users/my-profile"; //done

  static const String editMyProfile = "$baseUrl/users/update-my-profile"; //done

  static const String conditionsPage = "$baseUrl/settings"; //done

  static String confirmPayment(String sessionsId, String paymentId) =>
      "$baseUrl/payments/confirm-payment?sessionId=$sessionsId&paymentId=$paymentId"; //done

  static const String createPayment = "$baseUrl/payments/checkout"; //done

  static String paymentDetails(String id) => "$baseUrl/payments/$id"; //done

  static String singlePaymentByBookingId(String id) => "$baseUrl/payments/reference/$id"; //done

  static const String refundPayment =
      "$baseUrl/payments/refound-payment"; //done

  static const String membershipPackages = "$baseUrl/packages"; //done

  static const String creditPackages = "$baseUrl/credits?sort=credits"; //done

  static const  String createOrder = "$baseUrl/orders"; //done

  static const  String createSubscription = "$baseUrl/subscriptions"; //done

  static const String notifications =
      "$baseUrl/notification/my-notification"; //done
}
