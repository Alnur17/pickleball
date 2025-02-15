import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/common/app_images/app_images.dart';
import 'package:pickleball/common/helper_widget/header_section_widget.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';
import 'package:pickleball/common/widgets/custom_container.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper_widget/review_card_widget.dart';

class SessionDetailsView extends GetView {
  const SessionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
        ),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    color: AppColors.red,
                    child: Image.asset(
                      AppImages.containerImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: GestureDetector(
                    onTap: (){},
                    child: Image.asset(
                      AppImages.back,
                      scale: 4,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 20,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Colors.black26,
                    ),
                    child: Image.asset(
                      AppImages.star,
                      scale: 4,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 10,
                  right: Get.width * 0.35,
                  child: Expanded(
                    child: Text(
                      'Doubles Strategy Masterclass',
                      style: h1.copyWith(
                        color: AppColors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: -10,
                  child: CustomContainer(
                    height: 35,
                    text: 'Book Now',
                    imagePath: AppImages.arrowFly,
                    onTap: () {
                      log('Book Now Tapped');
                    },
                    backgroundColor: AppColors.textColorBlue,
                  ),
                ),
              ],
            ),
            sh20,
            TabBar(
              tabs: [
                Tab(text: 'Description'),
                Tab(text: 'Reviews'),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.lightGreen,
              labelColor: Colors.lightGreen,
              unselectedLabelColor: AppColors.black,
              dividerColor: AppColors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 80),
            ),
            sh16,
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Program Description',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          sh12,
                          Text(
                            'Master the art of playing doubles in this comprehensive session designed for intermediate to advanced Pickleball players. Learn winning strategies, effective communication techniques, and positional play to dominate the court with your partner.',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          sh20,
                          Text(
                            'Location',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          sh12,
                          Text(
                            'Sunset Pickleball Club, Miami Beach, FL',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          sh20,
                          Text(
                            'Session Type',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          sh12,
                          Text(
                            'Open Play',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          sh20,
                          Text(
                            'Skill-level',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          sh12,
                          Text(
                            'Beginner',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          sh20,
                          Text(
                            'Session Pricing',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          sh12,
                          Text(
                            '\$25 per session / \$90 for 4 sessions',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          sh20,
                          Text(
                            'Trainer',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          sh12,
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    NetworkImage(AppImages.profileImageTwo),
                              ),
                              sw12,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'John Smith',
                                    style: h6.copyWith(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  sw12,
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 20,
                                      ),
                                      Text(
                                        '4.5',
                                        style: h6.copyWith(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '10+ Years experience',
                                    style: h6.copyWith(
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                          sh20,
                          Text(
                            'Key learning objectives:',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          sh12,
                          Text(
                            '- Footwork drills\n- Advanced strategies\n- Doubles play tactics',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          sh20,
                          Text(
                            'Session Schedule:',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Duration: 60 minutes',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Time: 2:00 PM - 3:00 PM',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          sh20
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          HeaderSectionWidget(
                            title: 'Reviews',
                            actionText: '200 Reviews',
                            textColor: AppColors.black,
                            actionIcon: AppImages.arrowRightSmall,
                            onTap: () {},
                          ),
                          sh20,
                          ReviewCardWidget(
                            name: 'Emily R',
                            title: 'Incredible Sound and Comfort!',
                            reviewText: 'The noise cancellation is top-notch! I recently took a long flight, and this headset completely drowned out the engine noise. The battery lasted the entire trip, and the foldable design made it easy to pack. A must-have for travelers!',
                            date: 'December 20, 2024',
                          ),
                        ],
                      ),
                    ),
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
