import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/app/modules/dashboard/views/dashboard_view.dart';
import 'package:pickleball/common/app_color/app_colors.dart';
import 'package:pickleball/common/helper_widget/membership_container.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';

import '../../../../common/app_text_style/styles.dart';
import '../controllers/membership_controller.dart';

class MembershipView extends StatefulWidget {
  const MembershipView({super.key});

  @override
  State<MembershipView> createState() => _MembershipViewState();
}

class _MembershipViewState extends State<MembershipView> {
  final MembershipController membershipController =
      Get.put(MembershipController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        toolbarHeight: 10,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Choose Your Membership', style: h2),
            sh8,
            Text(
              'Select a membership plan that fits your goals',
              style: h6,
            ),
            sh20,
            Obx(() => membershipController.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : membershipController.membershipData.isEmpty
                    ? const Center(child: Text('No membership plans available'))
                    : ListView.builder(
                      shrinkWrap: true,
                      itemCount: membershipController.membershipData.length,
                      itemBuilder: (context, index) {
                        final membership =
                            membershipController.membershipData[index];
                        return Column(
                          children: [
                            MembershipContainer(
                              title: membership.title ?? 'Membership Plan',
                              benefits: membership.description,
                              price: '€${membership.price ?? 0}',
                              onTap: () {
                                membershipController.createSubscription(
                                    packageId: membership.id ?? '');
                              },
                            ),
                          ],
                        );
                      },
                    )),
            sh20,
            GestureDetector(
              onTap: () {
                Get.offAll(() => DashboardView());
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.deepOrangeAccent),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pay As You Go',
                      style: h1,
                    ),
                    sh12,
                    Text(
                      '• No annual fee',
                      style: h3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
