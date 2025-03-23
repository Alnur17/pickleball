import 'package:flutter/material.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';

import '../app_images/app_images.dart';
import '../app_text_style/styles.dart';

class TimeSlotWidget extends StatelessWidget {
  final String startTime;
  final String endTime;
  final bool isSelected;
  final double imageScale;
  final FontWeight fontWeight;
  final VoidCallback onTap;

  const TimeSlotWidget({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.isSelected,
    this.imageScale = 4.0,
    this.fontWeight = FontWeight.w500, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Image.asset(
              isSelected ? AppImages.checkBoxCircleFilled : AppImages.checkBoxCircle,
              scale: imageScale,
            ),
            sw8,
            Text(
              '$startTime - $endTime',
              style: h6.copyWith(fontWeight: fontWeight),
            ),
          ],
        ),
      ),
    );
  }
}
