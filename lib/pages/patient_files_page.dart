import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/file_item.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientFilesPage extends StatelessWidget {
  const PatientFilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.patientFiles),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  FileItem(
                    onPress: () {
                      Get.toNamed(RouteName.fileDetailsPage);
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  FileItem(
                    onPress: () {
                      Get.toNamed(RouteName.fileDetailsPage);
                    },
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
