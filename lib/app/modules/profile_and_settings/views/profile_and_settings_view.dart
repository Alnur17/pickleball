import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/app/modules/profile_and_settings/views/about_us_view.dart';
import 'package:pickleball/app/modules/profile_and_settings/views/history_view.dart';
import 'package:pickleball/app/modules/profile_and_settings/views/notifications_view.dart';
import 'package:pickleball/app/modules/profile_and_settings/views/password_management_view.dart';
import 'package:pickleball/app/modules/profile_and_settings/views/privacy_and_security_view.dart';
import 'package:pickleball/app/modules/profile_and_settings/views/term_and_conditios_view.dart';
import 'package:pickleball/common/app_text_style/styles.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_list_tile.dart';
import '../controllers/profile_and_settings_controller.dart';
import 'edit_profile_view.dart';

class ProfileAndSettingsView extends GetView<ProfileAndSettingsController> {
  const ProfileAndSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text('Profile & Settings', style: appBarStyle),
        automaticallyImplyLeading: false,
        // leading: GestureDetector(
        //   onTap: () {},
        //   child: Image.asset(
        //     AppImages.back,
        //     scale: 4,
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sh20,
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(AppImages.profileImageTwo),
            ),
            sh12,
            Text(
              'Lukas Wagner',
              style: h2.copyWith(fontSize: 20),
            ),
            sh12,
            CustomListTile(
              onTap: () {
                Get.to(() => HistoryView());
              },
              leadingImage: AppImages.history,
              title: 'History',
              trailingImage: AppImages.arrowRightSmall,
            ),
            Divider(),
            CustomListTile(
              onTap: () {
                Get.to(() => EditProfileView());
              },
              leadingImage: AppImages.edit,
              title: 'Edit Profile',
              trailingImage: AppImages.arrowRightSmall,
            ),
            Divider(),
            CustomListTile(
              onTap: () {
                Get.to(() => PasswordManagementView());
              },
              leadingImage: AppImages.key,
              title: 'Password Management',
              trailingImage: AppImages.arrowRightSmall,
            ),
            Divider(),
            CustomListTile(
              onTap: () {
                Get.to(() => NotificationsView());
              },
              leadingImage: AppImages.notificationTwo,
              title: 'Notifications',
              trailingImage: AppImages.arrowRightSmall,
            ),
            Divider(),
            CustomListTile(
              onTap: () {
                Get.to(() => PrivacyAndSecurityView());
              },
              leadingImage: AppImages.privacy,
              title: 'Privacy and security',
              trailingImage: AppImages.arrowRightSmall,
            ),
            Divider(),
            CustomListTile(
              onTap: () {
                Get.to(() => TermsAndConditionsView());
              },
              leadingImage: AppImages.termsAndConditions,
              title: 'Terms & Conditions',
              trailingImage: AppImages.arrowRightSmall,
            ),
            Divider(),
            CustomListTile(
              onTap: () {
                Get.to(() => AboutUsView());
              },
              leadingImage: AppImages.aboutUs,
              title: 'About Us',
              trailingImage: AppImages.arrowRightSmall,
            ),
            Divider(),
            CustomListTile(
              onTap: () {},
              leadingImage: AppImages.logout,
              title: 'Log out',
              trailingImage: AppImages.arrowRightSmall,
            ),
            sh116,
          ],
        ),
      ),
    );
  }
}
