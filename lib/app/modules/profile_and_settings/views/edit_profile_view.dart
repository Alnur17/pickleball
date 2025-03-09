import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/app/modules/profile_and_settings/controllers/profile_and_settings_controller.dart';
import 'package:pickleball/common/app_text_style/styles.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_container.dart';
import '../../../../common/widgets/custom_textfield.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  ProfileAndSettingsController profileAndSettingsController = Get.find<ProfileAndSettingsController>();

  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController ageTEController = TextEditingController();
  final TextEditingController contactTEController = TextEditingController();

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
          'Edit Profile',
          style: appBarStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              sh20,
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(AppImages.profileImageTwo),
                  ),
                  Positioned(
                    bottom: 2.5,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        log("Add icon tapped");
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Image.asset(
                            AppImages.camera,
                            scale: 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              sh20,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name',
                    style: h6.copyWith(fontWeight: FontWeight.w700),
                  ),
                  sh8,
                  CustomTextField(
                    hintText: 'Lukas Wagner',
                  ),
                  sh12,
                  Text(
                    'Email',
                    style: h6.copyWith(fontWeight: FontWeight.w700),
                  ),
                  sh8,
                  CustomTextField(
                    hintText: 'lukas.wagner@gmail.com',
                  ),
                  sh12,
                  Text(
                    'Age',
                    style: h6.copyWith(fontWeight: FontWeight.w700),
                  ),
                  sh8,
                  CustomTextField(
                    hintText: '24',
                  ),
                  sh12,
                  Text(
                    'Contact',
                    style: h6.copyWith(fontWeight: FontWeight.w700),
                  ),
                  sh8,
                  CustomTextField(
                    hintText: '+8801521547864',
                  ),
                  sh60,
                  Center(
                    child: CustomContainer(
                      text: 'Save Changes',
                      imagePath: AppImages.arrowFlyWhite,
                      onTap: () {},
                      height: 35,
                      width: 170,
                      backgroundColor: AppColors.textColorBlue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
