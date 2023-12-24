import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';

class DogDetailsPage extends StatelessWidget {
  const DogDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const CustomAppBar(title: AppStrings.dogsData),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: ShapeDecoration(
                    color: const Color(0x38ECECEC),
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
                                  top: 75, left: 20, right: 20, bottom: 25),
                              width: 382,
                              height: 235,
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
                                  Text(
                                    AppStrings.nameCapital,
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
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              left: 115,
                              right: 115,
                              top: 0,
                              child: Container(
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
                              ))
                        ],
                      )
                    ],
                  ))),
                  const SingleChildScrollView(child: Center(child: Text("hi"))),
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
