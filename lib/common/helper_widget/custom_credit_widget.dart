import 'package:flutter/material.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';
import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';

class CustomCreditWidget extends StatelessWidget {
  final int credits;
  final double price;
  final bool isSelected;
  final VoidCallback onTap;
  final Color borderColor;
  final Color iconColor;

  const CustomCreditWidget({
    super.key,
    required this.credits,
    required this.price,
    required this.isSelected,
    required this.onTap,
    this.borderColor = AppColors.orangeLight,
    this.iconColor = AppColors.orangeLight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.orangeLight.withOpacity(0.2)
              : AppColors.transparent,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: iconColor,
                  size: 24,
                ),
                sw5,
                Text(
                  '$credits',
                  style: h1.copyWith(
                    fontSize: 20,
                    color: isSelected
                        ? AppColors.orangeLight
                        : AppColors.textColorBlue,
                  ),
                ),
                sw5,
                Text(
                  'Credits',
                  style: h6.copyWith(
                    color: isSelected
                        ? AppColors.orangeLight
                        : AppColors.textColorBlue,
                  ),
                ),
              ],
            ),
            Text(
              '£${price.toStringAsFixed(2)}',
              style: h1.copyWith(
                fontSize: 20,
                color:
                isSelected ? AppColors.orangeLight : AppColors.textColorBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}