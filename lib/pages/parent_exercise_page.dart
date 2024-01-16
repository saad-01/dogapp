import 'package:dogapp/components/list_expert_item.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/appbar.dart';
import '../components/custom_tile.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';

class ParentExercisePage extends StatelessWidget {
  const ParentExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CustomAppBar(
                title: AppStrings.exercises,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      color: Colors.black.withOpacity(0.11999999731779099),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x1E000000),
                      blurRadius: 8,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: TabBar(
                  unselectedLabelColor: AppColors.black,
                  labelColor: AppColors.white,
                  unselectedLabelStyle: Styles.expertSignupPaget1(),
                  labelStyle: Styles.white16UTxt(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  indicatorColor: AppColors.primaryColor,
                  splashBorderRadius: BorderRadius.circular(10),
                  tabs: const <Widget>[
                    Tab(
                      text: AppStrings.training,
                    ),
                    Tab(
                      text: AppStrings.experts,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            CustomTile(
                              title: AppStrings.exercises,
                              leading: AssetImages.swimDog,
                              trailing: AssetImages.nextBlackIcon,
                              clr: AppColors.white,
                              onPress: () {
                                Get.toNamed(RouteName.expertExDetailPage);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTile(
                              title: AppStrings.games,
                              leading: AssetImages.playDog,
                              trailing: AssetImages.nextBlackIcon,
                              clr: AppColors.white,
                              onPress: () {
                                // Get.toNamed(RouteName.makeAnnouncementPage);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTile(
                              title: AppStrings.goodManners,
                              leading: AssetImages.tickDog,
                              trailing: AssetImages.nextBlackIcon,
                              clr: AppColors.white,
                              onPress: () {
                                // Get.toNamed(RouteName.makeAnnouncementPage);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(RouteName.walkPage);
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Ink(
                                  height: 73,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF277DAB),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.50,
                                        color: Colors.black
                                            .withOpacity(0.11999999731779099),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x0F000000),
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(AssetImages.walking),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SvgPicture.asset(
                                              AssetImages.verticalDividerlg),
                                        ],
                                      ),
                                      Text(
                                        AppStrings.walkRouts,
                                        style: Styles.white18(),
                                      ),
                                      SvgPicture.asset(
                                          AssetImages.nextWhiteIcon),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppStrings.trainingPrograms,
                                  style: Styles.expertSignupPaget1(),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 145,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: ShapeDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(1.00, 0.00),
                                  end: Alignment(-1, 0),
                                  colors: [
                                    Color(0xFF003D7D),
                                    Color(0xFF003D7D)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.50,
                                    color: Colors.black
                                        .withOpacity(0.11999999731779099),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x0F000000),
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppStrings.stopBitting,
                                          style: Styles.white16(),
                                        ),
                                        Expanded(
                                            child: Text(
                                          AppStrings.bittingNote,
                                          style: Styles.white8(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        LinearProgressIndicator(
                                          value: 0.45,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          minHeight: 9,
                                          color: const Color(0xFFd60285),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppStrings.theory,
                                              style: Styles.white8(),
                                            ),
                                            Text(
                                              '45%',
                                              style: Styles.white8(),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        LinearProgressIndicator(
                                          value: 0.55,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          minHeight: 9,
                                          color: const Color(0xFFdb8041),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppStrings.exercises,
                                              style: Styles.white8(),
                                            ),
                                            Text(
                                              '55%',
                                              style: Styles.white8(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AssetImages.stopBitting),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 145,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: ShapeDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(1.00, 0.00),
                                  end: Alignment(-1, 0),
                                  colors: [
                                    Color(0xFF7D3F00),
                                    Color(0xFF623100)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.50,
                                    color: Colors.black
                                        .withOpacity(0.11999999731779099),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x0F000000),
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppStrings.payAttention,
                                          style: Styles.white16(),
                                        ),
                                        Expanded(
                                            child: Text(
                                          AppStrings.payAttenNote,
                                          style: Styles.white8(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        LinearProgressIndicator(
                                          value: 0.45,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          minHeight: 9,
                                          color: const Color(0xFF029ed7),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppStrings.theory,
                                              style: Styles.white8(),
                                            ),
                                            Text(
                                              '45%',
                                              style: Styles.white8(),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        LinearProgressIndicator(
                                          value: 0.55,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          minHeight: 9,
                                          color: const Color(0xFF19b70a),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              AppStrings.exercises,
                                              style: Styles.white8(),
                                            ),
                                            Text(
                                              '55%',
                                              style: Styles.white8(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          AssetImages.payAttention),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              width: 382,
                              height: 143,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              decoration: ShapeDecoration(
                                color: AppColors.darkBrown,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.50,
                                    color: Colors.black
                                        .withOpacity(0.11999999731779099),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x0F000000),
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          AppStrings.findExpert,
                                          style: Styles.sliderText(),
                                        ),
                                        Text(
                                          AppStrings.availExperts,
                                          style: Styles.white12(),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: Ink(
                                            width: 170,
                                            height: 28,
                                            decoration: ShapeDecoration(
                                              color: AppColors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                AppStrings.find,
                                                style: TextStyle(
                                                  color: AppColors.darkBrown,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SvgPicture.asset(AssetImages.jummping),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppStrings.yourDogExperts,
                                style: Styles.expertSignupPaget1(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const ListExpertItem(),
                            const SizedBox(
                              height: 10,
                            ),
                            const ListExpertItem(),
                            const SizedBox(
                              height: 10,
                            ),
                            const ListExpertItem(),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
