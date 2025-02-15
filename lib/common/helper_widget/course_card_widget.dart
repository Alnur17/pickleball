import 'package:flutter/material.dart';
import 'package:pickleball/common/helper_widget/skill_badge.dart';

import '../app_color/app_colors.dart';
import '../app_images/app_images.dart';
import '../app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';
import '../widgets/custom_container.dart';

class CourseCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String time;
  final String location;
  final String skillLevel;
  final String price;
  final String? backgroundImage;
  final double? width;
  final double? height;
  final VoidCallback onViewDetails;

  const CourseCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.skillLevel,
    required this.price,
    this.backgroundImage,
    this.width = 300,
    this.height = 300,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(backgroundImage ?? AppImages.containerImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black38,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style:
                            h1.copyWith(fontSize: 15, color: AppColors.white),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: ShapeDecoration(
                        shape: CircleBorder(),
                        color: Colors.black12,
                      ),
                      child: Image.asset(
                        AppImages.star,
                        scale: 4,
                      ),
                    ),
                  ],
                ),
                sh10,
                Text(
                  description,
                  style: h6.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sh10,
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppImages.calendar,
                          scale: 4,
                        ),
                        sw5,
                        Text(
                          date,
                          style: h6.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    sw12,
                    Row(
                      children: [
                        Image.asset(
                          AppImages.clock,
                          scale: 4,
                        ),
                        sw5,
                        Text(
                          time,
                          style: h6.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                sh10,
                Row(
                  children: [
                    SkillBadge(label: skillLevel),
                    sw10,
                    SkillBadge(label: '$price per session'),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Image.asset(
                      AppImages.locationFilled,
                      scale: 4,
                    ),
                    sw5,
                    Expanded(
                      child: Text(
                        location,
                        style: h6.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    CustomContainer(
                      backgroundColor: Colors.black38,
                      text: 'View Details',
                      imagePath: AppImages.arrowFlyBig,
                      onTap: onViewDetails,
                      //padding: EdgeInsets.zero,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
