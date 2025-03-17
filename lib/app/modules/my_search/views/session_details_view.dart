import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickleball/app/modules/my_search/controllers/my_search_controller.dart';
import 'package:pickleball/app/modules/my_search/views/booking_confirmation_view.dart';
import 'package:pickleball/common/app_images/app_images.dart';
import 'package:pickleball/common/size_box/custom_sizebox.dart';
import 'package:pickleball/common/widgets/custom_container.dart';
import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';

class SessionDetailsView extends StatefulWidget {
  final String? id;

  const SessionDetailsView({super.key, this.id});

  @override
  State<SessionDetailsView> createState() => _SessionDetailsViewState();
}

class _SessionDetailsViewState extends State<SessionDetailsView> {
  final MySearchController mySearchController = Get.put(MySearchController());

  @override
  void initState() {
    super.initState();
    mySearchController.fetchSessionsDetails(widget.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: Obx(
        () => mySearchController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : mySearchController.sessionsDetails.value == null
                ? const Center(child: Text("No session details available"))
                : Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            child: Container(
                              height: 250,
                              width: double.infinity,
                              color: AppColors.red,
                              child: mySearchController
                                          .sessionsDetails.value?.thumbnail !=
                                      null
                                  ? Image.network(
                                      mySearchController
                                          .sessionsDetails.value!.thumbnail!,
                                      fit: BoxFit.cover,
                                      scale: 4,
                                      // errorBuilder:
                                      //     (context, error, stackTrace) {
                                      //   return Image.asset(
                                      //     AppImages.containerImage,
                                      //     fit: BoxFit.cover,
                                      //   );
                                      // },
                                    )
                                  : Image.asset(
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
                              onTap: () => Get.back(),
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
                              decoration: const ShapeDecoration(
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
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    mySearchController
                                            .sessionsDetails.value!.name ??
                                        'Unknown',
                                    style: h1.copyWith(
                                      color: AppColors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 20,
                            bottom: -10,
                            child: CustomContainer(
                              height: 35,
                              text: 'Book Now',
                              imagePath: AppImages.arrowFlyWhite,
                              onTap: () =>
                                  Get.to(() => BookingConfirmationView()),
                              backgroundColor: AppColors.textColorBlue,
                            ),
                          ),
                        ],
                      ),
                      sh30,
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Program Description',
                                    style: h3.copyWith(
                                        fontWeight: FontWeight.w700)),
                                sh12,
                                Text(
                                  mySearchController
                                          .sessionsDetails.value!.description ??
                                      'No description available',
                                  style:
                                      h6.copyWith(fontWeight: FontWeight.w500),
                                ),
                                sh20,
                                Text('Location',
                                    style: h3.copyWith(
                                        fontWeight: FontWeight.w700)),
                                sh12,
                                Text(
                                  mySearchController
                                          .sessionsDetails.value!.location ??
                                      '',
                                  style:
                                      h6.copyWith(fontWeight: FontWeight.w500),
                                ),
                                sh20,
                                Text('Session Type',
                                    style: h3.copyWith(
                                        fontWeight: FontWeight.w700)),
                                sh12,
                                Text(
                                  mySearchController
                                          .sessionsDetails.value!.status ??
                                      '',
                                  style:
                                      h6.copyWith(fontWeight: FontWeight.w500),
                                ),
                                sh20,
                                Text('Skill-level',
                                    style: h3.copyWith(
                                        fontWeight: FontWeight.w700)),
                                sh12,
                                Text(
                                  mySearchController
                                          .sessionsDetails.value!.skillLevel ??
                                      '',
                                  style:
                                      h6.copyWith(fontWeight: FontWeight.w500),
                                ),
                                sh20,
                                Text('Session Pricing',
                                    style: h3.copyWith(
                                        fontWeight: FontWeight.w700)),
                                sh12,
                                Text(
                                  '\$${mySearchController.sessionsDetails.value!.price ?? 0} per session',
                                  style:
                                      h6.copyWith(fontWeight: FontWeight.w500),
                                ),
                                sh20,
                                Text('Trainer',
                                    style: h3.copyWith(
                                        fontWeight: FontWeight.w700)),
                                sh12,
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                        mySearchController.sessionsDetails
                                                .value!.coach?.user?.photoUrl ??
                                            AppImages.profileImageTwo,
                                      ),
                                    ),
                                    sw12,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          mySearchController.sessionsDetails
                                                  .value!.coach?.user?.name ??
                                              'John Smith',
                                          style: h6.copyWith(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        sh8,
                                        Text(
                                          '${mySearchController.sessionsDetails.value!.coach?.experience ?? 10}+ Years experience',
                                          style: h6.copyWith(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                sh20,
                                Text('Key learning objectives:',
                                    style: h3.copyWith(
                                        fontWeight: FontWeight.w700)),
                                sh12,
                                Text(
                                  mySearchController
                                          .sessionsDetails.value!.description ??
                                      '- Footwork drills\n- Advanced strategies\n- Doubles play tactics',
                                  style:
                                      h6.copyWith(fontWeight: FontWeight.w500),
                                ),
                                sh20,
                                Text('Session Schedule:',
                                    style: h3.copyWith(
                                        fontWeight: FontWeight.w700)),
                                sh12,
                                Text(
                                  'Duration: ${mySearchController.sessionsDetails.value!.duration ?? 60} minutes',
                                  style:
                                      h6.copyWith(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Time: ${mySearchController.sessionsDetails.value!.startTime ?? '2:00 PM'} - ${mySearchController.sessionsDetails.value!.endTime ?? '3:00 PM'}',
                                  style:
                                      h6.copyWith(fontWeight: FontWeight.w500),
                                ),
                                sh20,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return DefaultTabController(
//     length: 2,
//     child: Scaffold(
//       backgroundColor: AppColors.mainColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.mainColor,
//         scrolledUnderElevation: 0,
//         automaticallyImplyLeading: false,
//         toolbarHeight: 0,
//       ),
//       body: Column(
//         children: [
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Positioned(
//                 child: Container(
//                   height: 300,
//                   width: double.infinity,
//                   color: AppColors.red,
//                   child: Image.asset(
//                     AppImages.containerImage,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Positioned.fill(
//                 child: Container(
//                   color: Colors.black.withOpacity(0.4),
//                 ),
//               ),
//               Positioned(
//                 left: 20,
//                 top: 20,
//                 child: GestureDetector(
//                   onTap: (){
//                     Get.back();
//                   },
//                   child: Image.asset(
//                     AppImages.back,
//                     scale: 4,
//                     color: AppColors.white,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 right: 20,
//                 top: 20,
//                 child: Container(
//                   height: 35,
//                   width: 35,
//                   decoration: ShapeDecoration(
//                     shape: CircleBorder(),
//                     color: Colors.black26,
//                   ),
//                   child: Image.asset(
//                     AppImages.star,
//                     scale: 4,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 20,
//                 bottom: 10,
//                 right: Get.width * 0.35,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         'Doubles Strategy Masterclass',
//                         style: h1.copyWith(
//                           color: AppColors.white,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 right: 20,
//                 bottom: -10,
//                 child: CustomContainer(
//                   height: 35,
//                   text: 'Book Now',
//                   imagePath: AppImages.arrowFlyWhite,
//                   onTap: () {
//                     Get.to(()=> BookingConfirmationView());
//                   },
//                   backgroundColor: AppColors.textColorBlue,
//                 ),
//               ),
//             ],
//           ),
//           sh20,
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
//           sh16,
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
//                           'Program Description',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         sh12,
//                         Text(
//                           'Master the art of playing doubles in this comprehensive session designed for intermediate to advanced Pickleball players. Learn winning strategies, effective communication techniques, and positional play to dominate the court with your partner.',
//                           style: h6.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         sh20,
//                         Text(
//                           'Location',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         sh12,
//                         Text(
//                           'Sunset Pickleball Club, Miami Beach, FL',
//                           style: h6.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         sh20,
//                         Text(
//                           'Session Type',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         sh12,
//                         Text(
//                           'Open Play',
//                           style: h6.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         sh20,
//                         Text(
//                           'Skill-level',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         sh12,
//                         Text(
//                           'Beginner',
//                           style: h6.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         sh20,
//                         Text(
//                           'Session Pricing',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         sh12,
//                         Text(
//                           '\$25 per session / \$90 for 4 sessions',
//                           style: h6.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         sh20,
//                         Text(
//                           'Trainer',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         sh12,
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               radius: 25,
//                               backgroundImage:
//                               NetworkImage(AppImages.profileImageTwo),
//                             ),
//                             sw12,
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'John Smith',
//                                   style: h6.copyWith(
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                                 sw12,
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.star,
//                                       color: Colors.yellow,
//                                       size: 20,
//                                     ),
//                                     Text(
//                                       '4.5',
//                                       style: h6.copyWith(
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ],
//                                 ),
//                                 Text(
//                                   '10+ Years experience',
//                                   style: h6.copyWith(
//                                       fontWeight: FontWeight.w500),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                         sh20,
//                         Text(
//                           'Key learning objectives:',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         sh12,
//                         Text(
//                           '- Footwork drills\n- Advanced strategies\n- Doubles play tactics',
//                           style: h6.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         sh20,
//                         Text(
//                           'Session Schedule:',
//                           style: h3.copyWith(
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           'Duration: 60 minutes',
//                           style: h6.copyWith(fontWeight: FontWeight.w500),
//                         ),
//                         Text(
//                           'Time: 2:00 PM - 3:00 PM',
//                           style: h6.copyWith(fontWeight: FontWeight.w500),
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
//                           reviewText: 'The noise cancellation is top-notch! I recently took a long flight, and this headset completely drowned out the engine noise. The battery lasted the entire trip, and the foldable design made it easy to pack. A must-have for travelers!',
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
