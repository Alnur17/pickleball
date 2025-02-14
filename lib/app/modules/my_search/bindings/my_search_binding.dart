import 'package:get/get.dart';

import '../controllers/my_search_controller.dart';

class MySearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySearchController>(
      () => MySearchController(),
    );
  }
}
