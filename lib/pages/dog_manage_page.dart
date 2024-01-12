import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';

import '../components/dog_manage_item.dart';

class DogManagementPage extends StatelessWidget {
  const DogManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: const Column(
          children: [
            CustomAppBar(title: AppStrings.management),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  DogManageWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  DogManageWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  DogManageWidget()
                ],
              ),
            ))
          ],
        ),
      )),
    );
  
  }
}
