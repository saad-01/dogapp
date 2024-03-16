import 'package:dogapp/components/alternating_btn.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/view_models/walk_stats_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/styles.dart';

class WalkPage extends StatefulWidget {
  const WalkPage({super.key});

  @override
  State<WalkPage> createState() => _WalkPageState();
}

class _WalkPageState extends State<WalkPage> {
  final doc = Get.arguments;
  final vm = Get.put(WalkStatsModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
           CustomAppBar(title: AppStrings.walk.tr),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                      future: vm.getTotalWalk(doc['dogId']),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ); // Show loading indicator while fetching data
                        } else {
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            if (snapshot.hasData && snapshot.data!.exists) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 128,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 26,
                                        ),
                                        decoration: ShapeDecoration(
                                          color: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 0.50,
                                              color: AppColors.black
                                                  .withOpacity(
                                                      0.11999999731779099),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          shadows: const [
                                            BoxShadow(
                                              color: Color(0x1E000000),
                                              blurRadius: 8,
                                              offset: Offset(0, 0),
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              vm.totalDistance.toString(),
                                              style: Styles.primary24(),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Km',
                                              style:
                                                  Styles.expertSignupPageH1(),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              AppStrings.totalDistance.tr,
                                              style: Styles.noteTxt(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 128,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          decoration: ShapeDecoration(
                                            color: AppColors.white,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                width: 0.50,
                                                color: AppColors.black
                                                    .withOpacity(
                                                        0.11999999731779099),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            shadows: const [
                                              BoxShadow(
                                                color: Color(0x1E000000),
                                                blurRadius: 8,
                                                offset: Offset(0, 0),
                                                spreadRadius: 0,
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      AssetImages.footPrint),
                                                  Text(
                                                    vm.totalSteps.toString(),
                                                    style: Styles.primary24(),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    AppStrings.totalSteps.tr,
                                                    style: Styles.noteTxt(),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      AssetImages.backup),
                                                  Text(
                                                    '${vm.totalDuration.inMinutes}:${vm.totalDuration.inSeconds.remainder(60)}',
                                                    style: Styles.primary24(),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    AppStrings.duration.tr,
                                                    style: Styles.noteTxt(),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            } else {
                              return Text(
                                AppStrings.none.tr,
                                style: Styles.grey16(),
                              );
                            }
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 128,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: ShapeDecoration(
                              color: AppColors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.50,
                                  color: AppColors.black
                                      .withOpacity(0.11999999731779099),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x1E000000),
                                  blurRadius: 8,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FutureBuilder(
                                  future: vm.getMostRecentWalk(doc['dogId']),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator(
                                        color: AppColors.primaryColor,
                                      ); // Show loading indicator while fetching data
                                    } else {
                                      if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      } else {
                                        if (snapshot.hasData &&
                                            snapshot.data!.exists) {
                                          // Extract data from the document snapshot
                                          var data = snapshot.data!.data()
                                              as Map<String, dynamic>;
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                AppStrings.recentWalk.tr,
                                                style: Styles.noteTxt(),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        data['distance'],
                                                        style:
                                                            Styles.primary24(),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Km',
                                                        style: Styles.noteTxt(),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        data['duration'],
                                                        style:
                                                            Styles.primary24(),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        AppStrings.minutes.tr,
                                                        style: Styles.noteTxt(),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        data['steps'],
                                                        style:
                                                            Styles.primary24(),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        AppStrings.steps.tr,
                                                        style: Styles.noteTxt(),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Text(
                                            AppStrings.none.tr,
                                            style: Styles.grey16(),
                                          );
                                        }
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    AlternatingButton(
                        title: AppStrings.addRecordManually.tr,
                        outlined: true,
                        width: MediaQuery.sizeOf(context).width,
                        height: 62,
                        withIcon: true,
                        icon: AssetImages.addIcon,
                        style: Styles.primary14(),
                        onPress: () {
                          Get.toNamed(RouteName.addWalkPage, arguments: doc);
                        }),
                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   height: 62,
                    //   decoration: ShapeDecoration(
                    //     color: AppColors.white,
                    //     shape: RoundedRectangleBorder(
                    //       side: BorderSide(
                    //         width: 0.50,
                    //         color: AppColors.black
                    //             .withOpacity(0.11999999731779099),
                    //       ),
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //   ),
                    //   child: SwipeButton(
                    //     height: 60,
                    //     borderRadius: BorderRadius.circular(8),
                    //     activeThumbColor: AppColors.primaryColor,
                    //     activeTrackColor: Colors.white,
                    //     thumb: SvgPicture.asset(
                    //       AssetImages.swipe,
                    //     ),
                    //     child: Text(
                    //       AppStrings.swipe.tr,
                    //       style: Styles.black14(),
                    //     ),
                    //     onSwipeEnd: () {
                    //       Get.toNamed(RouteName.walkRecordPage);
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
