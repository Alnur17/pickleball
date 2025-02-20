import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_textfield.dart';

class WriteReviewView extends GetView {
  const WriteReviewView({super.key});

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
        title: Text('Write Review', style: appBarStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh16,
              Container(
                padding: EdgeInsets.all(10),
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
              for (int i = 5; i > 0; i--)
                Row(
                  children: [
                    Text('$i★', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 8),
                    Expanded(
                      child: LinearProgressIndicator(
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(6),
                        value: i == 5
                            ? 0.8
                            : i == 4
                                ? 0.4
                                : i == 3
                                    ? 0.6
                                    : i == 2
                                        ? 0.2
                                        : 0.1,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.textColorBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              sh20,
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 24,
                  ),
                ),
              ),
              sh20,
              Text(
                'Please share your opinion',
                style: h3,
              ),
              sh8,
              CustomTextField(
                height: 100,
                hintText: 'Your review',
                containerColor: AppColors.silver.withOpacity(0.3),
                borderColor: AppColors.silver,
              ),
              sh40,
              Center(
                child: CustomButton(
                  borderRadius: 12,
                  backgroundColor: AppColors.textColorBlue,
                  text: 'Submit',
                  onPressed: () {},
                  width: 120,
                  height: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
