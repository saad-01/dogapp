import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/appoint_widget.dart';
import 'package:dogapp/components/btn_sm.dart';
import 'package:dogapp/components/custom_tile.dart';
import 'package:dogapp/components/img_with_txt.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/training_streak.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/pic_container.dart';

class DogDetailsPage extends StatelessWidget {
  const DogDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    final doc = arguments.data();
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const CustomAppBar(title: AppStrings.dogsData),
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
                        text: AppStrings.data,
                      ),
                      Tab(
                        text: AppStrings.profile,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: TabBarView(children: <Widget>[
                  SingleChildScrollView(
                      child: Center(
                          child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 15, right: 15, bottom: 25),
                              decoration: ShapeDecoration(
                                color: AppColors.white,
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
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    doc['name'],
                                    style: Styles.expertSignupPaget1(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    AppStrings.releaseDogData,
                                    style: Styles.expertSignupPaget1(),
                                  ),
                                  Text(
                                    AppStrings.createRelease,
                                    style: Styles.subText(),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ButtonSmall(
                                          title: AppStrings.editRecord,
                                          icon: AssetImages.editIcon,
                                          primaryAlike: false,
                                          color: AppColors.white),
                                      SizedBox(
                                        width: 10,
                                      ),
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
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: PicContainer(
                                width: 94,
                                height: 94,
                                child: Image.network(doc['photoUrl']),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.50,
                              color:
                                  Colors.black.withOpacity(0.11999999731779099),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.healthData,
                              style: Styles.primary20G(),
                            ),
                            Text(
                              AppStrings.healthSub,
                              style: Styles.lightGrey12(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(AssetImages.medicineImage),
                                SvgPicture.asset(AssetImages.capsuleImage),
                                SvgPicture.asset(AssetImages.medBottle),
                                SvgPicture.asset(AssetImages.blueMed),
                                const SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset(AssetImages.yellowMed),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: PrimartyButton(
                                title: AppStrings.appAppoint,
                                width: 242,
                                height: 12,
                                icon: '',
                                onTap: () {
                                  Get.toNamed(RouteName.addAppointmentPage);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.parentExPage);
                              },
                              child: const ImageWithText(
                                title: AppStrings.exerciseExpert,
                                image: AssetImages.excerciseExpert,
                                clr: AppColors.exercieBox,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.feedManagePage);
                              },
                              child: const ImageWithText(
                                title: AppStrings.feedManage,
                                image: AssetImages.dogFood,
                                clr: AppColors.foodBox,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTile(
                        title: AppStrings.safetyEmergency,
                        leading: AssetImages.dogBelt,
                        trailing: AssetImages.nextWhiteIcon,
                        clr: const Color(0xFF007F84),
                        onPress: () {
                          Get.toNamed(RouteName.safetyEmergencyPage);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTile(
                        title: AppStrings.gotoCommunity,
                        leading: AssetImages.communityIcon,
                        trailing: AssetImages.nextWhiteIcon,
                        clr: const Color(0xFFB25423),
                        onPress: () {
                          Get.toNamed(RouteName.communityPage);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.weight,
                          style: Styles.expertSignupPaget1(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomTile(
                        title: AppStrings.kg,
                        leading: AssetImages.weightMachine,
                        trailing: AssetImages.addIcon,
                        clr: Color(0xFFFFF2F9),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.reminders,
                          style: Styles.expertSignupPaget1(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppointmentWidget(
                          type: AppStrings.vaccination,
                          name: AppStrings.dogName,
                          date: AppStrings.dateFormat,
                          time: AppStrings.time,
                          image: AssetImages.injectionImage,
                          title: AppStrings.approved,
                          onPress: () {
                            Get.toNamed(RouteName.appointDetailsPage);
                          },
                          approvalFlag: true),
                      const SizedBox(
                        height: 11,
                      ),
                      AppointmentWidget(
                          type: AppStrings.medicine,
                          name: AppStrings.dogName,
                          date: AppStrings.dateFormat,
                          time: AppStrings.time,
                          image: AssetImages.medImage,
                          title: AppStrings.denied,
                          onPress: () {
                            Get.toNamed(RouteName.appointDetailsPage);
                          },
                          approvalFlag: false),
                    ],
                  ))),
                  SingleChildScrollView(
                      child: Center(
                          child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 15, right: 15, bottom: 25),
                              decoration: ShapeDecoration(
                                color: AppColors.white,
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
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    doc['name'],
                                    style: Styles.expertSignupPaget1(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    AppStrings.releaseDogData,
                                    style: Styles.expertSignupPaget1(),
                                  ),
                                  Text(
                                    AppStrings.createRelease,
                                    style: Styles.subText(),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ButtonSmall(
                                          title: AppStrings.editRecord,
                                          icon: AssetImages.editIcon,
                                          primaryAlike: false,
                                          color: AppColors.white),
                                      SizedBox(
                                        width: 10,
                                      ),
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
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: PicContainer(
                                width: 94,
                                height: 94,
                                child: Image.network(doc['photoUrl']),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppStrings.filesFromExpert,
                                  style: Styles.expertSignupPaget1()),
                              Text(AppStrings.releaseFiles,
                                  style: Styles.lightGrey12()),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(RouteName.selectReportPage,
                                  arguments: false);
                            },
                            child: Row(
                              children: [
                                Text(
                                  AppStrings.seeAll,
                                  style: Styles.subYellowText(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(AssetImages.nextYellowIcon)
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFFFAF2),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 86,
                              height: 86,
                              decoration: ShapeDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(AssetImages.dogItem),
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1.50, color: Color(0xFF1FAB89)),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.nameCapital,
                                    style: Styles.expertSignupPaget1(),
                                  ),
                                  Text(
                                    "Leptospirosis(${AppStrings.vaccination})",
                                    style: Styles.subPrimaryText(),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    AppStrings.note,
                                    style: Styles.noteTxt(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SvgPicture.asset(AssetImages.slider),
                      const SizedBox(
                        height: 20,
                      ),
                      const TrainingStreakWidget(),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: ShapeDecoration(
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.50,
                              color:
                                  Colors.black.withOpacity(0.11999999731779099),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${AppStrings.dogName}:',
                                        style: Styles.grey14()),
                                    Text(
                                      doc['name'],
                                      style: Styles.black14(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${AppStrings.breed}:',
                                        style: Styles.grey14()),
                                    Text(
                                      doc['breed'],
                                      style: Styles.black14(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${AppStrings.dateOfBirth}:',
                                        style: Styles.grey14()),
                                    Text(
                                      doc['date'],
                                      style: Styles.black14(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${AppStrings.gender}:',
                                        style: Styles.grey14()),
                                    Text(
                                      doc['gender'],
                                      style: Styles.black14(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${AppStrings.weight}:',
                                        style: Styles.grey14()),
                                    Text(
                                      doc['weight'],
                                      style: Styles.black14(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${AppStrings.microChipNum}:',
                                        style: Styles.grey14()),
                                    Text(
                                      doc['microchipNumber'],
                                      style: Styles.black14(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const PrimartyButton(
                                title: AppStrings.editProfile,
                                width: 180,
                                height: 12,
                                icon: AssetImages.editWhite),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ))),
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
