import 'package:flutter/material.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final String imagePath;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback onTap;

  const CustomContainer({
    super.key,
    required this.text,
    this.textStyle,
    required this.imagePath,
    this.backgroundColor = AppColors.transparent,
    this.padding,
    this.borderRadius,
    this.height = 48,
    required this.onTap, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: textStyle ??
                  h6.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            sw5,
            Image.asset(imagePath, scale: 4),
          ],
        ),
      ),
    );
  }
}
