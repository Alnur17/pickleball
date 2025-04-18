import 'package:flutter/material.dart';
import 'package:pickleball/common/widgets/custom_button.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class BookingCardWaitlistWidget extends StatelessWidget {
  final String coachName;
  final String sessionTitle;
  final String date;
  final String imageUrl;
  final VoidCallback onCancel;

  const BookingCardWaitlistWidget({
    super.key,
    required this.coachName,
    required this.sessionTitle,
    required this.date,
    required this.imageUrl,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.silver)),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(imageUrl),
              ),
              sw12,
              Text(
                coachName,
                style: h6.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          sh8,
          Text(
            sessionTitle,
            style: h5.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          sh12,
          CustomButton(
            height: 40,
            text: 'Cancel',
            onPressed: onCancel,
            borderColor: AppColors.red,
            borderRadius: 12,
            textColor: AppColors.red,
            backgroundColor: AppColors.redLight,
          ),
        ],
      ),
    );
  }
}
