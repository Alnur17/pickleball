import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/common/app_color/app_colors.dart';
import 'package:pickleball/common/app_text_style/styles.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';
import 'package:pickleball/common/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../common/app_images/app_images.dart';
import '../controllers/my_search_controller.dart';

class TrainerProfileView extends StatefulWidget {
  final String? id;

  const TrainerProfileView({super.key, this.id});

  @override
  State<TrainerProfileView> createState() => _TrainerProfileViewState();
}

class _TrainerProfileViewState extends State<TrainerProfileView> {
  final MySearchController mySearchController = Get.put(MySearchController());

  @override
  void initState() {
    super.initState();
    mySearchController.fetchTrainersDetails(widget.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Trainer Profile',
          style: appBarStyle,
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 4),
            child: Image.asset(
              AppImages.back,
              scale: 4,
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (mySearchController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (mySearchController.trainerDetails.value == null) {
          return const Center(child: Text('No trainer data available'));
        }
        return _buildTrainerProfile(context);
      }),
    );
  }

  Widget _buildTrainerProfile(BuildContext context) {
    final trainer = mySearchController.trainerDetails.value!;

    return Column(
      children: [
        sh10,
        CircleAvatar(
          radius: 50,
          backgroundImage: trainer.photoUrl != null
              ? NetworkImage(trainer.photoUrl!)
              : NetworkImage(AppImages.profileImageTwo) as ImageProvider,
        ),
        sh12,
        Text(
          trainer.name ?? 'Unknown Trainer',
          style: h3.copyWith(fontWeight: FontWeight.w700),
        ),
        sh12,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  trainer.experience != null
                      ? '${trainer.experience}+ Years'
                      : 'N/A',
                  style: h3.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.black100),
                ),
                Text('experience', style: h4),
              ],
            ),
            sw12,
            Text(
              trainer.perHourRate != null
                  ? '\$${trainer.perHourRate}/hour'
                  : 'N/A',
              style: h3.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.black100),
            ),
          ],
        ),
        sh20,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomButton(
                  height: 40,
                  borderRadius: 12,
                  backgroundColor: AppColors.transparent,
                  borderColor: AppColors.blue,
                  textStyle: h5.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue,
                  ),
                  text: 'Email',
                  onPressed: trainer.email != null
                      ? () {
                          _launchEmail(trainer.email!);
                          print(
                              ':::::::::::: ${trainer..email!} :::::::::::::::');
                        }
                      : () {},
                  imageAssetPath: AppImages.email,
                ),
              ),
              sw16,
              Expanded(
                child: CustomButton(
                  height: 40,
                  borderRadius: 12,
                  backgroundColor: AppColors.transparent,
                  borderColor: AppColors.blue,
                  text: 'Call Trainer',
                  textStyle: h5.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue,
                  ),
                  onPressed: trainer.contactNumber != null
                      ? () => _launchPhone(trainer.contactNumber!)
                      : () {},
                  imageAssetPath: AppImages.call,
                ),
              ),
            ],
          ),
        ),
        sh20,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bio',
                        style: h3.copyWith(fontWeight: FontWeight.w700)),
                    sh12,
                    Text(
                      trainer.bio ?? 'No bio available',
                      style: h6.copyWith(fontWeight: FontWeight.w500),
                    ),
                    sh20,
                    Text('Achievements',
                        style: h3.copyWith(fontWeight: FontWeight.w700)),
                    sh12,
                    Text(
                      trainer.achievement ?? 'No achievements listed',
                      style: h6.copyWith(fontWeight: FontWeight.w500),
                    ),
                    sh20,
                    Text('Coaching Expertise',
                        style: h3.copyWith(fontWeight: FontWeight.w700)),
                    sh12,
                    ...trainer.coachingExpertise.map(
                      (expertise) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          expertise,
                          style: h6.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    sh20,
                    Text('Skill Level',
                        style: h3.copyWith(fontWeight: FontWeight.w700)),
                    sh12,
                    Text(
                      trainer.skillExpertise ?? 'Not specified',
                      style: h6.copyWith(fontWeight: FontWeight.w500),
                    ),
                    sh20,
                    Text('Location',
                        style: h3.copyWith(fontWeight: FontWeight.w700)),
                    sh12,
                    Text(
                      trainer.location ?? 'Location not specified',
                      style: h6.copyWith(fontWeight: FontWeight.w500),
                    ),
                    sh20,
                    // Text('Time slots',
                    //     style: h3.copyWith(fontWeight: FontWeight.w700)),
                    // sh12,
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           trainer.duration != null
                    //               ? 'Duration: ${trainer.duration}'
                    //               : 'Duration: N/A',
                    //           style: h6.copyWith(fontWeight: FontWeight.w500),
                    //         ),
                    //         Text(
                    //           trainer.startTime != null && trainer.endTime != null
                    //               ? 'Time: ${DateTimeFormationClass.formatTime(trainer.startTime ?? '',trainer.endTime ?? '')}'
                    //               : 'Time: N/A',
                    //           style: h6.copyWith(fontWeight: FontWeight.w500),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    // sh20,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to launch email
  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      //queryParameters: {'subject': 'Contact from Pickleball App'},
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      Get.snackbar('Error', 'Could not launch email client');
    }
  }

  // Helper method to launch phone dialer
  Future<void> _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      Get.snackbar('Error', 'Could not launch phone dialer');
    }
  }
}

//
// @override
// Widget build(BuildContext context) {
//   return DefaultTabController(
//     length: 2,
//     child: Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         backgroundColor: AppColors.white,
//         scrolledUnderElevation: 0,
//         title: Text(
//           'Trainer Profile',
//           style: appBarStyle,
//         ),
//         leading: GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(left: 20, top: 4),
//             child: Image.asset(
//               AppImages.back,
//               scale: 4,
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           sh10,
//           CircleAvatar(
//             radius: 50,
//             backgroundImage: NetworkImage(AppImages.profileImageTwo),
//           ),
//           sh12,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'John Smith',
//                 style: h3.copyWith(fontWeight: FontWeight.w700),
//               ),
//               sw8,
//               Text(
//                 '⭐ 4.5',
//                 style: h3.copyWith(fontWeight: FontWeight.w700),
//               ),
//             ],
//           ),
//           sh12,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     '10+ Years',
//                     style: h3.copyWith(
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.black100),
//                   ),
//                   Text(
//                     'experience ',
//                     style: h4,
//                   ),
//                 ],
//               ),
//               sw12,
//               Text(
//                 '\$50/hour',
//                 style: h3.copyWith(
//                     fontWeight: FontWeight.w700, color: AppColors.black100),
//               ),
//             ],
//           ),
//           sh20,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CustomButton(
//                 width: 120,
//                 borderRadius: 12,
//                 backgroundColor: AppColors.transparent,
//                 borderColor: AppColors.blue,
//                 textColor: AppColors.blue,
//                 text: 'Email',
//                 onPressed: () {},
//                 imageAssetPath: AppImages.email,
//               ),
//               sw20,
//               CustomButton(
//                 width: 150,
//                 borderRadius: 12,
//                 backgroundColor: AppColors.transparent,
//                 borderColor: AppColors.blue,
//                 textColor: AppColors.blue,
//                 text: 'Call Trainer',
//                 onPressed: () {},
//                 imageAssetPath: AppImages.call,
//               ),
//             ],
//           ),
//           sh12,
//           TabBar(
//             tabs: [
//               Tab(text: 'Description'),
//               Tab(text: 'Reviews'),
//             ],
//             indicatorSize: TabBarIndicatorSize.tab,
//             indicatorColor: Colors.lightGreen,
//             labelColor: Colors.lightGreen,
//             unselectedLabelColor: AppColors.black,
//             dividerColor: AppColors.transparent,
//             padding: EdgeInsets.symmetric(horizontal: 80),
//           ),
//           sh12,
//           Expanded(
//             child: TabBarView(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Bio',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         sh12,
//                         Text(
//                           'With over 12 years of coaching experience, Coach John specializes in doubles strategy, footwork mastery, and tournament preparation. An IPTPA-certified instructor and former national champion, he has helped players of all levels refine their technique and elevate their game. Passionate about precision and strategy, Coach John’s training focuses on building confidence, smart shot selection, and court awareness. Whether you\'re a beginner or a competitive player, his tailored coaching approach ensures measurable improvement and on-court success. 🎾🔥',
//                           style: h6.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         sh20,
//                         Text(
//                           ' Achievements',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         sh12,
//                         Text(
//                           'SCertified IPTPA Level II Coach – Recognized for excellence in player development \nCoached 100+ Players to Tournament Wins – Including state and national titles \nFormer Professional Player – Competed in [League/Tournament Name] at an elite level \nFeatured Speaker at Pickleball Summits – Conducted training workshops and strategy sessions \nTop-Ranked Doubles Player – Dominated competitive circuits \nDeveloped Training Programs for Elite Players – Customized drills and performance-based coaching',
//                           style: h6.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         sh20,
//                         Text(
//                           'Coaching Expertise',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         sh12,
//                         Text(
//                           'Doubles Strategy',
//                           style: h6.copyWith(fontWeight: FontWeight.w700),
//                         ),
//                         sh12,
//                         Text(
//                           'TournamentCoach',
//                           style: h6.copyWith(fontWeight: FontWeight.w700),
//                         ),
//                         sh20,
//                         Text(
//                           'Availability',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         sh12,
//                         Text(
//                           'Mon-Sat',
//                           style: h6.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         sh20,
//                         Text(
//                           ' Skill Level',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         sh12,
//                         Text(
//                           '- Beginner',
//                           style: h6.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         sh8,
//                         Text(
//                           '- Intermediate',
//                           style: h6.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         sh20,
//                         Text(
//                           'Time slots',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         sh12,
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Duration: 60 minutes',
//                               style: h6.copyWith(fontWeight: FontWeight.w500),
//                             ),
//                             Text(
//                               'Duration: 60 minutes',
//                               style: h6.copyWith(fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Time: 2:00 PM - 3:00 PM',
//                               style: h6.copyWith(fontWeight: FontWeight.w500),
//                             ),
//                             Text(
//                               'Time: 4:00 PM - 5:00 PM',
//                               style: h6.copyWith(fontWeight: FontWeight.w500),
//                             ),
//                           ],
//                         ),
//                         sh20
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         HeaderSectionWidget(
//                           title: 'Reviews',
//                           actionText: '200 Reviews',
//                           textColor: AppColors.black,
//                           actionIcon: AppImages.arrowRightSmall,
//                           onTap: () {},
//                         ),
//                         sh20,
//                         ReviewCardWidget(
//                           name: 'Emily R',
//                           title: 'Incredible Sound and Comfort!',
//                           reviewText:
//                           'The noise cancellation is top-notch! I recently took a long flight, and this headset completely drowned out the engine noise. The battery lasted the entire trip, and the foldable design made it easy to pack. A must-have for travelers!',
//                           date: 'December 20, 2024',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
