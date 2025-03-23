import 'package:get/get.dart';

import 'package:pickleball/app/modules/profile_and_settings/controllers/conditions_controller.dart';
import 'package:pickleball/app/modules/profile_and_settings/controllers/my_all_booking_controller.dart';

import '../controllers/profile_and_settings_controller.dart';

class ProfileAndSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAllBookingController>(
      () => MyAllBookingController(),
    );
    Get.lazyPut<ConditionsController>(
      () => ConditionsController(),
    );
    Get.lazyPut<ProfileAndSettingsController>(
      () => ProfileAndSettingsController(),
    );
  }
}
