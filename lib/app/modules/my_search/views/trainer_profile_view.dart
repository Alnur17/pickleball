import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pickleball/common/app_color/app_colors.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';
import 'package:pickleball/common/widgets/custom_button.dart';

import '../../../../common/app_images/app_images.dart';
import '../../../../common/helper_widget/header_section_widget.dart';
import '../../../../common/helper_widget/review_card_widget.dart';

class TrainerProfileView extends GetView {
  const TrainerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          scrolledUnderElevation: 0,
          title: Text(
            'Trainer Profile',
            style: appBarStyle,
          ),
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 4),
              child: Image.asset(
                AppImages.back,
                scale: 4,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            sh10,
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(AppImages.profileImageTwo),
            ),
            sh12,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'John Smith',
                  style: h3.copyWith(fontWeight: FontWeight.w700),
                ),
                sw8,
                Text(
                  '⭐ 4.5',
                  style: h3.copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            sh12,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '10+ Years',
                      style: h3.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.black100),
                    ),
                    Text(
                      'experience ',
                      style: h4,
                    ),
                  ],
                ),
                sw12,
                Text(
                  '\$50/hour',
                  style: h3.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.black100),
                ),
              ],
            ),
            sh20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  width: 120,
                  borderRadius: 12,
                  backgroundColor: AppColors.transparent,
                  borderColor: AppColors.blue,
                  textColor: AppColors.blue,
                  text: 'Email',
                  onPressed: () {},
                  imageAssetPath: AppImages.email,
                ),
                sw20,
                CustomButton(
                  width: 150,
                  borderRadius: 12,
                  backgroundColor: AppColors.transparent,
                  borderColor: AppColors.blue,
                  textColor: AppColors.blue,
                  text: 'Call Trainer',
                  onPressed: () {},
                  imageAssetPath: AppImages.call,
                ),
              ],
            ),
            sh12,
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
            sh12,
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
                            'Bio',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          sh12,
                          Text(
                            'With over 12 years of coaching experience, Coach John specializes in doubles strategy, footwork mastery, and tournament preparation. An IPTPA-certified instructor and former national champion, he has helped players of all levels refine their technique and elevate their game. Passionate about precision and strategy, Coach John’s training focuses on building confidence, smart shot selection, and court awareness. Whether you\'re a beginner or a competitive player, his tailored coaching approach ensures measurable improvement and on-court success. 🎾🔥',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          sh20,
                          Text(
                            ' Achievements',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          sh12,
                          Text(
                            'SCertified IPTPA Level II Coach – Recognized for excellence in player development \nCoached 100+ Players to Tournament Wins – Including state and national titles \nFormer Professional Player – Competed in [League/Tournament Name] at an elite level \nFeatured Speaker at Pickleball Summits – Conducted training workshops and strategy sessions \nTop-Ranked Doubles Player – Dominated competitive circuits \nDeveloped Training Programs for Elite Players – Customized drills and performance-based coaching',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          sh20,
                          Text(
                            'Coaching Expertise',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          sh12,
                          Text(
                            'Doubles Strategy',
                            style: h6.copyWith(fontWeight: FontWeight.w700),
                          ),
                          sh12,
                          Text(
                            'TournamentCoach',
                            style: h6.copyWith(fontWeight: FontWeight.w700),
                          ),
                          sh20,
                          Text(
                            'Availability',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          sh12,
                          Text(
                            'Mon-Sat',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          sh20,
                          Text(
                            ' Skill Level',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          sh12,
                          Text(
                            '- Beginner',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          sh8,
                          Text(
                            '- Intermediate',
                            style: h6.copyWith(fontWeight: FontWeight.w500),
                          ),
                          sh20,
                          Text(
                            'Time slots',
                            style: h3.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          sh12,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Duration: 60 minutes',
                                style: h6.copyWith(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Duration: 60 minutes',
                                style: h6.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Time: 2:00 PM - 3:00 PM',
                                style: h6.copyWith(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Time: 4:00 PM - 5:00 PM',
                                style: h6.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
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
                            reviewText:
                                'The noise cancellation is top-notch! I recently took a long flight, and this headset completely drowned out the engine noise. The battery lasted the entire trip, and the foldable design made it easy to pack. A must-have for travelers!',
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
