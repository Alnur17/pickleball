import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/helper_widget/custom_credit_widget.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';
import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/widgets/custom_button.dart';
import '../controllers/credit_pack_controller.dart';

class CreditPackView extends StatefulWidget { // Changed to StatelessWidget
  const CreditPackView({super.key});

  @override
  State<CreditPackView> createState() => _CreditPackViewState();
}

class _CreditPackViewState extends State<CreditPackView> {
  final CreditPackController creditPackController = Get.put(CreditPackController());

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
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
      body: Obx(() =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            sh40,
            if (creditPackController.isLoading.value)
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (creditPackController.creditList.isEmpty)
              const Expanded(
                child: Center(child: Text('No credit packs available')),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: creditPackController.creditList.length,
                  itemBuilder: (context, index) {
                    final pack = creditPackController.creditList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: CustomCreditWidget(
                        credits: pack.credits ?? 0,
                        price: pack.price ?? 0.0,
                        isSelected: creditPackController.selectedIndex.value == index,
                        onTap: () => creditPackController.selectItem(index),
                      ),
                    );
                  },
                ),
              ),
            CustomButton(
              text: 'Buy Now',
              onPressed:(){},
              gradientColors: AppColors.gradientColor,
            ),
            sh16,
          ],
        ),
      ),
      ),
    );
  }
}