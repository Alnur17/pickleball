import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/app/modules/payment/views/payment_details_view.dart';
import 'package:pickleball/common/app_text_style/styles.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/size_box/custom_sizebox.dart';

class PaymentConfirmationView extends StatefulWidget {
  const PaymentConfirmationView({super.key});

  @override
  State<PaymentConfirmationView> createState() =>
      _PaymentConfirmationViewState();
}

class _PaymentConfirmationViewState extends State<PaymentConfirmationView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      return Get.off(() => PaymentDetailsView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(left: 20),
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: AppColors.silver,
            ),
            child: Image.asset(
              AppImages.close,
              scale: 4,
            ),
          ),
        ),
        title: Text('Payment Confirmation', style: appBarStyle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.payment,
              scale: 4,
            ),
            sh8,
            Text(
              'Payment Successful',
              style: h3,
            )
          ],
        ),
      ),
    );
  }
}
