import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_color/app_colors.dart';
import '../app_images/app_images.dart';
import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class CustomProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String currentPrice;
  final String originalPrice;
  final double rating;
  final VoidCallback onCardTap;
  final VoidCallback onBookmarkTap;

  const CustomProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.currentPrice,
    required this.originalPrice,
    required this.rating,
    required this.onCardTap,
    required this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap, // Handle tap on the card
      child: SizedBox(
        width: Get.width * 0.6,
        child: Card(
          color: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      imageUrl,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: GestureDetector(
                      onTap: onBookmarkTap, // Handle tap on the bookmark icon
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppImages.bookmarkSmall,
                          scale: 4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: h5.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    sh5,
                    Row(
                      children: [
                        Text(
                          '\$$currentPrice',
                          style: h5.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '\$$originalPrice',
                          style: h6.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              rating.toString(),
                              style: h5.copyWith(fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
