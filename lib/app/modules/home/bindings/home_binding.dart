import 'package:get/get.dart';

import 'package:pickleball/app/modules/home/controllers/notifications_controller.dart';
import 'package:pickleball/app/modules/home/controllers/subscription_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(),
    );
    Get.lazyPut<SubscriptionController>(
      () => SubscriptionController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
