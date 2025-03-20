import 'package:flutter/material.dart';
import 'package:pickleball/common/app_images/app_images.dart';
import 'package:pickleball/common/widgets/custom_button.dart';
import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class BookingCompletedHistoryCard extends StatelessWidget {
  final String coachName;
  final String sessionTitle;
  final String date;
  final String amountPaid;
  final String time;
  final String imageUrl;
  final String status; // "Complete" or "Canceled"
  final VoidCallback onRebook;
  final VoidCallback? onLeaveReview;
  final VoidCallback? onViewRefund;

  const BookingCompletedHistoryCard({
    super.key,
    required this.coachName,
    required this.sessionTitle,
    required this.date,
    required this.time,
    required this.imageUrl,
    required this.status,
    required this.onRebook,
    this.onLeaveReview,
    this.onViewRefund,
    required this.amountPaid,
  });

  Color getStatusColor() {
    return status == "Complete" ? AppColors.lightGreenTwo : AppColors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.silver),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 22, backgroundImage: NetworkImage(imageUrl)),
              sw12,
              Expanded(
                child: Text(coachName,
                    style: h6.copyWith(fontWeight: FontWeight.w500)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: getStatusColor().withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(status,
                    style: h6.copyWith(
                        color: getStatusColor(), fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          sh8,
          // Session Title
          Text(sessionTitle, style: h5.copyWith(fontWeight: FontWeight.w700)),
          sh8,
          Row(
            children: [
              Text('Amount Paid',
                  style: h6.copyWith(fontWeight: FontWeight.w500)),
              sw12,
              Text('\$$amountPaid',
                  style: h6.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          sh8,
          // Date and Time
          Row(
            children: [
              Image.asset(AppImages.calendar, scale: 4, color: AppColors.black),
              sw8,
              Text(date, style: h6.copyWith(fontWeight: FontWeight.w500)),
              sw30,
              Image.asset(AppImages.clock, scale: 4, color: AppColors.black),
              sw8,
              Text(time, style: h6.copyWith(fontWeight: FontWeight.w500)),
            ],
          ),
          // Show Refund button only when status is "Canceled"
          if (status == "Canceled" && onViewRefund != null) ...[
            sh12,
            CustomButton(
              height: 40,
              text: 'View Refund',
              onPressed: onViewRefund!,
              borderColor: AppColors.red,
              borderRadius: 12,
              textColor: AppColors.red,
              backgroundColor: Colors.red.withOpacity(0.1),
            ),
          ],
        ],
      ),
    );
  }
}
