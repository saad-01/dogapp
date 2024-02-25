import 'package:dogapp/components/file_item.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/appbar.dart';
import '../components/btn_sm.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';

class ExpertProfilePage extends StatelessWidget {
  const ExpertProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    RxBool showHealth = false.obs;
    RxBool showTrain = false.obs;
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CustomAppBar(title: AppStrings.expertProfile),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: ShapeDecoration(
                  color: const Color(0xfffafbfb),
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
                      text: AppStrings.profile,
                    ),
                    Tab(
                      text: AppStrings.sharedData,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 15,
                                        right: 15,
                                        bottom: 25),
                                    decoration: ShapeDecoration(
                                      color: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.50,
                                          color: AppColors.black
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
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            const SizedBox(
                                              height: 60,
                                            ),
                                            Text(
                                              "K-Devis",
                                              style: Styles.expertSignupPaget1()
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    '${AppStrings.dateOfBirth}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  AppStrings.dateFormat,
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('${AppStrings.gender}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  AppStrings.gender,
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    '${AppStrings.expertSpeciality}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  AppStrings.expertSpeciality,
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    '${AppStrings.totalTrainings}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  '00',
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ButtonSmall(
                                                title: AppStrings.saveRecord,
                                                icon: AssetImages.save,
                                                primaryAlike: false,
                                                color: AppColors.white),
                                            ButtonSmall(
                                              title: AppStrings.shareRecord,
                                              icon: AssetImages.shareIcon,
                                              primaryAlike: true,
                                              color: AppColors.shareBtnClr,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    left: 0,
                                    top: 0,
                                    right: 0,
                                    child: SizedBox(
                                      height: 86,
                                      width: 86,
                                      child: Image.asset(
                                        AssetImages.squareExpert,
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 56,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: ShapeDecoration(
                                color: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.50, color: Color(0x3F737373)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x0F000000),
                                    blurRadius: 6,
                                    offset: Offset(-2, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.healthData,
                                    style: Styles.black14(),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        if (showHealth.value) {
                                          showHealth.value = false;
                                        } else {
                                          showHealth.value = true;
                                        }
                                      },
                                      child: Obx(() => SvgPicture.asset(
                                          showHealth.value
                                              ? AssetImages.blackUp
                                              : AssetImages.dropDown))),
                                ],
                              ),
                            ),
                            Obx(
                              () => Visibility(
                                  visible: showHealth.value,
                                  child: const Column(
                                    children: [
                                      // FileItem(),
                                      // SizedBox(
                                      //   height: 8,
                                      // ),
                                      // FileItem(),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 56,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: ShapeDecoration(
                                color: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.50, color: Color(0x3F737373)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x0F000000),
                                    blurRadius: 6,
                                    offset: Offset(-2, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.trainingData,
                                    style: Styles.black14(),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        // if (showHealth.value) {
                                        //   showHealth.value = false;
                                        // } else {
                                        //   showHealth.value = true;
                                        // }
                                      },
                                      child: Obx(() => SvgPicture.asset(
                                          showTrain.value
                                              ? AssetImages.blackUp
                                              : AssetImages.dropDown))),
                                ],
                              ),
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
