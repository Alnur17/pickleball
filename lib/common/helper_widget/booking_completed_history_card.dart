import 'package:flutter/material.dart';
import 'package:pickleball/common/app_images/app_images.dart';
import 'package:pickleball/common/widgets/custom_button.dart';
import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class BookingCompletedHistoryCard extends StatelessWidget {
  final String? coachName;
  final String? sessionTitle;
  final String? date;
  final String? amountPaid;
  final String? startTime;
  final String? endTime;
  final String? imageUrl;
  final String? status;
  final VoidCallback? onRebook;
  final VoidCallback? onLeaveReview;
  final VoidCallback? onViewRefund;

  const BookingCompletedHistoryCard({
    super.key,
    this.coachName,
    this.sessionTitle,
    this.date,
    this.amountPaid,
    this.startTime,
    this.endTime,
    this.imageUrl,
    this.status,
    this.onRebook,
    this.onLeaveReview,
    this.onViewRefund,
  });

  Color getStatusColor() {
    switch (status?.toLowerCase()) {
      case "complete":
        return AppColors.lightGreenTwo;
      case "canceled":
        return AppColors.red;
      default:
        return AppColors.grey; // Fallback for unexpected statuses
    }
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
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(imageUrl ?? AppImages.profileImageTwo),
              ),
              sw12,
              Expanded(
                child: Text(
                  coachName ?? "Unknown Coach",
                  style: h6.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: getStatusColor().withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status ?? "Unknown",
                  style: h6.copyWith(
                    color: getStatusColor(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          sh8,
          Text(
            sessionTitle ?? "Untitled Session",
            style: h5.copyWith(fontWeight: FontWeight.w700),
          ),
          sh8,
          Row(
            children: [
              Text('Amount Paid', style: h6.copyWith(fontWeight: FontWeight.w500)),
              sw12,
              Text(
                '\$${amountPaid ?? "0"}',
                style: h6.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          sh8,
          Row(
            children: [
              Image.asset(AppImages.calendar, scale: 4, color: AppColors.black),
              sw8,
              Text(
                date ?? "N/A",
                style: h6.copyWith(fontWeight: FontWeight.w500),
              ),
              sw30,
              Image.asset(AppImages.clock, scale: 4, color: AppColors.black),
              sw8,
              Text(
                '${startTime ?? "N/A"} - ${endTime ?? "N/A"}',
                style: h6.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          sh12,
          Row(
            children: [
              if (status?.toLowerCase() == "complete" && onRebook != null)
                Expanded(
                  child: CustomButton(
                    height: 40,
                    text: 'Rebook',
                    onPressed: onRebook!,
                    borderColor: AppColors.lightGreenTwo,
                    borderRadius: 12,
                    textColor: AppColors.lightGreenTwo,
                    backgroundColor: AppColors.lightGreenTwo.withOpacity(0.1),
                  ),
                ),
              if (status?.toLowerCase() == "complete" && onRebook != null && onLeaveReview != null) sw12,
              if (status?.toLowerCase() == "complete" && onLeaveReview != null)
                Expanded(
                  child: CustomButton(
                    height: 40,
                    text: 'Leave Review',
                    onPressed: onLeaveReview!,
                    borderColor: AppColors.lightGreenTwo,
                    borderRadius: 12,
                    textColor: AppColors.lightGreenTwo,
                    backgroundColor: AppColors.lightGreenTwo.withOpacity(0.1),
                  ),
                ),
              if (status?.toLowerCase() == "canceled" && onViewRefund != null)
                Expanded(
                  child: CustomButton(
                    height: 40,
                    text: 'View Refund',
                    onPressed: onViewRefund!,
                    borderColor: AppColors.red,
                    borderRadius: 12,
                    textColor: AppColors.red,
                    backgroundColor: AppColors.red.withOpacity(0.1),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}