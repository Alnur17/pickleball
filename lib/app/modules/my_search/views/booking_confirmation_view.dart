import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/app/modules/payment/views/payment_confirmation_view.dart';
import 'package:pickleball/common/app_color/app_colors.dart';
import 'package:pickleball/common/app_images/app_images.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';

import '../../../../common/app_text_style/styles.dart';
import '../../../../common/widgets/custom_container.dart';

class BookingConfirmationView extends GetView {
  const BookingConfirmationView({super.key});

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
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 4),
            child: Image.asset(
              AppImages.back,
              scale: 4,
            ),
          ),
        ),
        title: Text(
          'Booking Confirmation',
          style: appBarStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            sh16,
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.silver),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColors.lightGreenTwo),
                    ),
                    child: Text(
                      'Training Program',
                      style: h7.copyWith(
                        color: AppColors.lightGreenTwo,
                      ),
                    ),
                  ),
                  sh8,
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            NetworkImage(AppImages.profileImageTwo),
                      ),
                      sw8,
                      Text(
                        'Coach John Smith',
                        style: h6.copyWith(
                          color: AppColors.black100,
                        ),
                      ),
                    ],
                  ),
                  sh8,
                  Text(
                    'Doubles Strategy Masterclass',
                    style: h4.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  sh8,
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppImages.calendar,
                            scale: 4,
                            color: AppColors.black,
                          ),
                          sw8,
                          Text(
                            '25 January 2025',
                            style: h6.copyWith(
                              color: AppColors.black100,
                            ),
                          ),
                        ],
                      ),
                      sw30,
                      Row(
                        children: [
                          Image.asset(
                            AppImages.clock,
                            scale: 4,
                            color: AppColors.black,
                          ),
                          sw8,
                          Text(
                            '2:00 PM - 3:00 PM',
                            style: h6.copyWith(
                              color: AppColors.black100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            sh20,
            Row(
              children: [
                Text(
                  'Total Payment:',
                  style: h3,
                ),
                Spacer(),
                Text(
                  '\$93.98',
                  style: h3,
                ),
              ],
            ),
            sh60,
            Center(
              child: CustomContainer(
                text: 'Proceed to Pay',
                imagePath: AppImages.arrowFlyWhite,
                onTap: () {
                  Get.to(()=> PaymentConfirmationView());
                },
                height: 35,
                width: 170,
                backgroundColor: AppColors.textColorBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
