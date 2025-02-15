import 'package:get/get.dart';

import '../controllers/profile_and_settings_controller.dart';

class ProfileAndSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileAndSettingsController>(
      () => ProfileAndSettingsController(),
    );
  }
}
