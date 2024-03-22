import 'dart:convert';

import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/pdf_file_item.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ExpertExDetailsPage extends StatefulWidget {
  const ExpertExDetailsPage({super.key});

  @override
  State<ExpertExDetailsPage> createState() => _ExpertExDetailsPageState();
}

class _ExpertExDetailsPageState extends State<ExpertExDetailsPage> {
  final doc = Get.arguments;
  List<dynamic> urlsList = [];
  List<String> imageList = [];
  List<String> fileList = [];
  void separateLists(List<dynamic> firebaseList) {
    for (var item in firebaseList) {
      String url = item[0];
      String type = item[1];
      if (type == 'image') {
        imageList.add(url);
      } else if (type == 'file') {
        fileList.add(url);
      }
    }
  }

  @override
  void initState() {
    urlsList = jsonDecode(doc['urls']);
    separateLists(urlsList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: doc['title']),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.description.tr,
                      style: Styles.appBarH1(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      doc['description'],
                      style: Styles.choosePageText(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.details.tr,
                      style: Styles.appBarH1(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0xFFD7D7D7)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      leading: SvgPicture.asset(AssetImages.menu),
                      title: Text(
                        AppStrings.trainingLevel.tr,
                        style: Styles.black14(),
                      ),
                      trailing: SizedBox(
                        width: 50,
                        child: Row(
                          children: [
                            SvgPicture.asset(AssetImages.primaryCircle),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              doc['level'],
                              style: Styles.black14(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0xFFD7D7D7)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      leading: SvgPicture.asset(AssetImages.alarm),
                      title: Text(
                        AppStrings.trainingLength.tr,
                        style: Styles.black14(),
                      ),
                      trailing: Text(
                        doc['length'],
                        style: Styles.black14(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0xFFD7D7D7)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      leading: SvgPicture.asset(AssetImages.equipment),
                      title: Text(
                        AppStrings.equipment.tr,
                        style: Styles.black14(),
                      ),
                      trailing: Text(
                        doc['equipment'],
                        style: Styles.black14(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.articles.tr,
                      style: Styles.appBarH1(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fileList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PdfFileItem(
                          onTap: () {
                            Get.toNamed(RouteName.pdfPage,
                                arguments: fileList[index]);
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.tutorial.tr,
                      style: Styles.appBarH1(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 158,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageList.length,
                      itemBuilder: (BuildContext context, int index) {
                        print(imageList.length);
                        return Container(
                          padding: const EdgeInsets.only(right: 14),
                          height: 158,
                          width: 258,
                          child: Image.network(
                            imageList[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Image.asset(AssetImages.videoTutorial),
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     Expanded(child: Image.asset(AssetImages.videoTutorial2)),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 25,
                  ),
                  PrimartyButton(
                      title: AppStrings.editExercise.tr,
                      width: 250,
                      height: 12,
                      onTap: () {},
                      icon: ''),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
