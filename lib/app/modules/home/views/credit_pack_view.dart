import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/helper_widget/custom_credit_widget.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';
import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/widgets/custom_button.dart';
import '../controllers/credit_pack_controller.dart';

class CreditPackView extends StatefulWidget {
  const CreditPackView({super.key});

  @override
  State<CreditPackView> createState() => _CreditPackViewState();
}

class _CreditPackViewState extends State<CreditPackView> {
  final CreditPackController creditPackController =
      Get.put(CreditPackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Credit Pack',
          style: appBarStyle,
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Image.asset(
            AppImages.back,
            scale: 4,
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            sh40,
            Expanded(
              child: Obx(
                () {
                  if (creditPackController.isLoading.value) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.textColorBlueV2,
                    ));
                  } else if (creditPackController.creditList.isEmpty) {
                    return const Center(
                        child: Text('No credit packs available'));
                  } else {
                    return ListView.builder(
                      key: ValueKey(creditPackController.selectedIndex.value),
                      itemCount: creditPackController.creditList.length,
                      itemBuilder: (context, index) {
                        final pack = creditPackController.creditList[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: CustomCreditWidget(
                            credits: pack.credits ?? 0,
                            price: pack.price ?? 0.0,
                            isSelected:
                                creditPackController.selectedIndex.value ==
                                    index,
                            onTap: () => creditPackController.selectItem(index),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            CustomButton(
              text: 'Buy Now',
              onPressed: () {
                if (creditPackController.creditList.isNotEmpty &&
                    creditPackController.selectedIndex.value >= 0) {
                  String packageId = creditPackController
                      .creditList[creditPackController.selectedIndex.value].id!;
                  debugPrint(
                      ':;;;;;;;;;;;packageID : $packageId :::::::::::::');
                  creditPackController.createOrder(creditId: packageId);
                } else {
                  Get.snackbar(
                      'Error', 'Please select a credit pack to purchase');
                }
              },
              gradientColors: AppColors.gradientColor,
            ),
            sh16,
          ],
        ),
      ),
    );
  }
}
