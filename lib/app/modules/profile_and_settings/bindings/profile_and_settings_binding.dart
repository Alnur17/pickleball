import 'package:get/get.dart';

import 'package:pickleball/app/modules/profile_and_settings/controllers/conditions_controller.dart';

import '../controllers/profile_and_settings_controller.dart';

class ProfileAndSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConditionsController>(
      () => ConditionsController(),
    );
    Get.lazyPut<ProfileAndSettingsController>(
      () => ProfileAndSettingsController(),
    );
  }
}
