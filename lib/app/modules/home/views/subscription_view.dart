import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/payment/views/payment_confirmation_view.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/widgets/custom_button.dart';
import '../controllers/subscription_controller.dart';

class SubscriptionView extends StatefulWidget {
  const SubscriptionView({super.key});

  @override
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  final SubscriptionController subscriptionController = Get.put(SubscriptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            AppImages.back,
            scale: 4,
          ),
        ),
        title: Text(
          "Subscription",
          style: appBarStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Premium Membership",
              style: h2.copyWith(color: AppColors.grey),
            ),
            sh20,
            Column(
              children: [
                _buildFeatureItem("Get special notification"),
                _buildFeatureItem("Get tournament update"),
                _buildFeatureItem("Create specific profile"),
              ],
            ),
            sh20,
            Row(
              children: [
                Obx(() => _buildPlanOption(
                      "Monthly",
                      "\$20.00",
                      !subscriptionController.isYearly.value,
                      'Select your plan',
                    )),
                sw12,
                Obx(() => _buildPlanOption(
                      "Yearly",
                      "\$200.00",
                      subscriptionController.isYearly.value,
                      'Select your plan',
                    )),
              ],
            ),
            sh50,
            CustomButton(
              text: 'Buy Now',
              onPressed: () {
                Get.off(()=> PaymentConfirmationView());
              },
              gradientColors: AppColors.gradientColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Image.asset(
            AppImages.rightBlack,
            scale: 4,
          ),
          sw12,
          Text(
            feature,
            style: h3.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanOption(
      String title, String price, bool selected, String planType) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          subscriptionController.isYearly.value = title == "Yearly";
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
            color: selected ? Colors.blue.shade50 : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (selected)
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    AppImages.rightGold,
                    scale: 4,
                  ),
                ),
              Text(
                title,
                style: h4,
              ),
              sh5,
              Text(
                price,
                style: h2,
              ),
              sh20,
              Text(
                planType,
                style: h4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
