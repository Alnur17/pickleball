import 'package:get/get.dart';

import 'package:pickleball/app/modules/payment/controllers/pdf_controller.dart';

import '../controllers/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfController>(
      () => PdfController(),
    );
    Get.lazyPut<PdfController>(
      () => PdfController(),
    );
    Get.lazyPut<PaymentController>(
      () => PaymentController(),
    );
  }
}
