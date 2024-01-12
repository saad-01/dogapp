import 'package:dogapp/components/alternating_btn.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MissedProfilePage extends StatelessWidget {
  const MissedProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const CustomAppBar(title: AppStrings.missingDogProfile),
                Expanded(
                  child: SingleChildScrollView(
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
                                      AppStrings.nameCapital,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                    SizedBox(
                                      width: 246,
                                      child: Text(
                                        AppStrings.lostNote,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Styles.subText(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: ShapeDecoration(
                                        color: const Color(0x38ECECEC),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 0.50,
                                            color: Colors.black.withOpacity(
                                                0.11999999731779099),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                        unselectedLabelStyle:
                                            Styles.expertSignupPaget1(),
                                        labelStyle: Styles.white16UTxt(),
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        indicator: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        indicatorColor: AppColors.primaryColor,
                                        splashBorderRadius:
                                            BorderRadius.circular(10),
                                        tabs: const <Widget>[
                                          Tab(
                                            text: AppStrings.dogsData,
                                          ),
                                          Tab(
                                            text: AppStrings.parentsData,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 0,
                              child: SizedBox(
                                height: 86,
                                width: 86,
                                child: Image.asset(
                                  AssetImages.dogItemPng,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 350,
                          child: TabBarView(children: <Widget>[
                            Center(
                                child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15, bottom: 15),
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
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${AppStrings.breed}:',
                                              style: Styles.grey14()),
                                          Text(
                                            AppStrings.breed,
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
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${AppStrings.weight}:',
                                              style: Styles.grey14()),
                                          Text(
                                            AppStrings.weight,
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
                                            AppStrings.microChipNum,
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
                                          Text('${AppStrings.lostDate}:',
                                              style: Styles.grey14()),
                                          Text(
                                            AppStrings.dateFormat,
                                            style: Styles.black14(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 100,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SvgPicture.asset(
                                            AssetImages.location,
                                            width: 20,
                                            height: 26,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            AppStrings.seeMap,
                                            style: Styles.primary20U(),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                            Center(
                                child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 15, bottom: 15),
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
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('${AppStrings.parentName}:',
                                                  style: Styles.grey14()),
                                              Text(
                                                'Name here',
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
                                              Text('${AppStrings.yourNumber}:',
                                                  style: Styles.grey14()),
                                              Text(
                                                '+1000000000',
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
                                              Text('${AppStrings.address}:',
                                                  style: Styles.grey14()),
                                              Text(
                                                AppStrings.addressHere,
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
                                              Text('${AppStrings.notes}:',
                                                  style: Styles.grey14()),
                                            ],
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              AppStrings.lostNote,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: Styles.lightGrey12(),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 130,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                          ]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        AlternatingButton(
                            title: AppStrings.shareDog,
                            outlined: true,
                            width: MediaQuery.sizeOf(context).width * 0.81,
                            height: 50,
                            style: Styles.primary20(),
                            withIcon: false),
                        const SizedBox(
                          height: 20,
                        ),
                        PrimartyButton(
                            title: AppStrings.chatParent,
                            width: MediaQuery.sizeOf(context).width * 0.81,
                            height: 12,
                            icon: ''),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  
  }
}
