import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_color/app_colors.dart';
import '../size_box/custom_sizebox.dart';

class CustomStoreCard extends StatelessWidget {
  final String imageUrl;
  final String storeName;
  final String distance;
  final double rating;

  const CustomStoreCard({
    super.key,
    required this.imageUrl,
    required this.storeName,
    required this.distance,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: SizedBox(
        width: Get.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          imageUrl,
                        ),
                      ),
                      sw12,
                      Text(
                        storeName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  sh12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$distance km from you',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
