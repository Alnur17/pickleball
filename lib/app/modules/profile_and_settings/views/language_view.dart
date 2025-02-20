import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/common/app_color/app_colors.dart';
import 'package:pickleball/common/app_text_style/styles.dart';

import '../../../../common/app_images/app_images.dart';

class LanguageView extends GetView {
  const LanguageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
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
        title: Text('Language',style: appBarStyle,),
      ),
      body: const Center(
        child: Text(
          'Language is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
