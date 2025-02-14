import 'package:flutter/material.dart';

import '../app_color/app_colors.dart';
import '../app_images/app_images.dart';
import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class ProfileCardWidget extends StatelessWidget {
  final String name;
  final double rating;
  final String experience;
  final String hourlyRate;
  final String profileImage;
  final VoidCallback onTap;

  const ProfileCardWidget({
    super.key,
    required this.name,
    required this.rating,
    required this.experience,
    required this.hourlyRate,
    required this.profileImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      //margin: const EdgeInsets.only(left: 20, right: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 22, backgroundImage: NetworkImage(profileImage)),
          sh8,
          Text(name, style: h2.copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
          sh5,
          Text("⭐ ${rating.toStringAsFixed(1)}", style: h2.copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
          sh8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(experience, style: h2.copyWith(fontSize: 12)),
              sw8,
              Text('\$$hourlyRate', style: h2.copyWith(fontSize: 12)),
            ],
          ),
          sh8,
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("View Details", style: h3.copyWith(fontSize: 12, fontWeight: FontWeight.w500)),
                sw5,
                Image.asset(AppImages.arrowFly, scale: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
