import 'package:flutter/material.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class MembershipContainer extends StatelessWidget {
  final String title;
  final List<String> benefits;
  final String price;
  final VoidCallback onTap;

  const MembershipContainer({
    super.key,
    required this.title,
    required this.benefits,
    required this.price, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: AppColors.gradientColor),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.deepOrangeAccent),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: h2.copyWith(color: AppColors.white),
            ),
            sh12,
            ...benefits.asMap().entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ${entry.value}',
                    style: h3.copyWith(color: AppColors.white),
                  ),
                  entry.key < benefits.length - 1 ? sh8 : const SizedBox(),
                ],
              );
            }),
            sh12,
            Text(
              price,
              style: h1.copyWith(
                color: AppColors.white,
                fontSize: 48,
              ),
            ),
          ],
        ),
      ),
    );
  }
}