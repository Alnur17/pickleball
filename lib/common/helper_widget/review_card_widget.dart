import 'package:flutter/material.dart';

import '../app_images/app_images.dart';
import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class ReviewCardWidget extends StatelessWidget {
  final String name;
  final String title;
  final String reviewText;
  final String date;
  final String imagePath; // You can use this to pass the star image asset path.

  const ReviewCardWidget({
    super.key,
    required this.name,
    required this.title,
    required this.reviewText,
    required this.date,
    this.imagePath = AppImages.stars,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              name,
              style: h6.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            sw8,
            Image.asset(
              imagePath,
              scale: 4,
              color: Colors.orange,
            ),
          ],
        ),
        sh5,
        Text(
          title,
          style: h6.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        sh8,
        Text(
          reviewText,
          style: h6.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        sh5,
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            date,
            style: h6.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
