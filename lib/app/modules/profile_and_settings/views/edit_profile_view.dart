
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/app/modules/profile_and_settings/controllers/profile_and_settings_controller.dart';
import 'package:pickleball/common/app_text_style/styles.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_loader.dart';
import '../../../../common/widgets/custom_textfield.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  ProfileAndSettingsController profileAndSettingsController =
      Get.find<ProfileAndSettingsController>();

  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController ageTEController = TextEditingController();
  final TextEditingController contactTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  void _loadProfileData() {
    nameTEController.text =
        profileAndSettingsController.myProfileData.value?.name ?? '';
    emailTEController.text =
        profileAndSettingsController.myProfileData.value?.email ?? '';
    ageTEController.text =
        (profileAndSettingsController.myProfileData.value?.age ?? '')
            .toString();
    contactTEController.text =
        profileAndSettingsController.myProfileData.value?.contactNumber ?? '';
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
              Obx(
                () {
                  return Stack(
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide(
                              width: 2,
                              color: AppColors.green,
                            ),
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: profileAndSettingsController
                                      .selectedImage.value !=
                                  null
                              ? FileImage(profileAndSettingsController
                                  .selectedImage.value!)
                              : (profileAndSettingsController
                                              .myProfileData.value?.photoUrl !=
                                          null &&
                                      profileAndSettingsController.myProfileData
                                          .value!.photoUrl!.isNotEmpty)
                                  ? NetworkImage(profileAndSettingsController
                                      .myProfileData.value!.photoUrl!)
                                  : AssetImage(AppImages.profileImageCamera)
                                      as ImageProvider,
                        ),
                      ),
                      Positioned(
                        bottom: 2.5,
                        left: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            profileAndSettingsController.pickImage();
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
                  );
                },
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
                    controller: nameTEController,
                    hintText: 'Enter your name',
                  ),
                  sh12,
                  Text(
                    'Email',
                    style: h6.copyWith(fontWeight: FontWeight.w700),
                  ),
                  sh8,
                  CustomTextField(
                    controller: emailTEController,
                    hintText: 'Enter your email',
                  ),
                  sh12,
                  Text(
                    'Age',
                    style: h6.copyWith(fontWeight: FontWeight.w700),
                  ),
                  sh8,
                  CustomTextField(
                    controller: ageTEController,
                    hintText: 'Enter your age',
                  ),
                  sh12,
                  Text(
                    'Contact',
                    style: h6.copyWith(fontWeight: FontWeight.w700),
                  ),
                  sh8,
                  CustomTextField(
                    controller: contactTEController,
                    hintText: 'Enter your number',
                  ),
                  sh60,
                  Obx(
                    () => profileAndSettingsController.isLoading.value == true
                        ? CustomLoader(
                            color: AppColors.white,
                          )
                        : CustomButton(
                            imageAssetPath: AppImages.arrowFlyWhite,
                            text: "Save Changes",
                            gradientColors: AppColors.gradientColor,
                            //backgroundColor: AppColors.textColorBlue,
                            onPressed: () {
                              profileAndSettingsController.updateProfile(
                                name: nameTEController.text,
                                email: emailTEController.text.toLowerCase(),
                                age: ageTEController.text,
                                contactNumber: contactTEController.text,
                              );
                            },
                          ),
                  ),
                  // Center(
                  //   child: CustomContainer(
                  //     text: 'Save Changes',
                  //     imagePath: AppImages.arrowFlyWhite,
                  //     onTap: () {
                  //       profileAndSettingsController.updateProfile(
                  //         name: nameTEController.text,
                  //         email: emailTEController.text.toLowerCase(),
                  //         age: ageTEController.text,
                  //         contactNumber: contactTEController.text,
                  //       );
                  //     },
                  //     height: 35,
                  //     width: 170,
                  //     backgroundColor: AppColors.textColorBlue,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
