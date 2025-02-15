import 'package:flutter/material.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';

class HeaderSectionWidget extends StatelessWidget {
  final String title;
  final String actionText;
  final String actionIcon;
  final Color? textColor;
  final VoidCallback onTap;

  const HeaderSectionWidget({
    super.key,
    required this.title,
    required this.actionText,
    required this.actionIcon,
    required this.onTap, this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: h4.copyWith(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                actionText,
                style: h6.copyWith(color: textColor ?? AppColors.textColorBlue),
              ),
              Image.asset(
                actionIcon,
                scale: 4,
              )
            ],
          ),
        ),
      ],
    );
  }
}