import 'package:flutter/material.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';

class SkillBadge extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const SkillBadge({
    super.key,
    required this.label,
    this.backgroundColor = Colors.black26,
    this.textColor = AppColors.lightGreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: backgroundColor,
      ),
      child: Text(
        label,
        style: h7.copyWith(color: textColor),
      ),
    );
  }
}