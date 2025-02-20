import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';
import 'package:pickleball/common/widgets/custom_button.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';

class PaymentDetailsView extends GetView {
  const PaymentDetailsView({super.key});

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
        title: Text(
          'Payment Details',
          style: appBarStyle,
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  sh40,
                  Text(
                    'Payment Total',
                    style: h5.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                    ),
                  ),
                  sh8,
                  Text(
                    '\$89.99',
                    style: h2.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  sh20,
                  _buildRow('Date', '31 Dec 2023'),
                  _buildRow('Transaction ID', '#123456789'),
                  _buildRow('Account', 'Neeraj'),
                  Divider(
                    color: Colors.grey.shade200,
                  ),
                  _buildRow('Total Payment', '\$89.99'),
                  _buildRow('Total', '\$89.99'),
                ],
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.white,
              child: Image.asset(
                AppImages.payment,
                scale: 4,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        //color: AppColors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              text: 'Get PDF Receipt',
              onPressed: () {},
              textColor: AppColors.black,
              imageAssetPath: AppImages.download,
              borderColor: AppColors.grey,
            ),
            sh10,
            CustomButton(
              text: 'Back to Homepage',
              onPressed: () {},
              textColor: AppColors.textColorBlue,
              imageAssetPath: AppImages.arrowLeft,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: h5.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
            ),
          ),
          Text(
            value,
            style: h5.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
