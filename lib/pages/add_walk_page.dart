import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/walk_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddWalkPage extends StatefulWidget {
  const AddWalkPage({super.key});

  @override
  State<AddWalkPage> createState() => _AddWalkPageState();
}

class _AddWalkPageState extends State<AddWalkPage> {
  final vm = Get.put(WalkModel());
  final doc = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.addManual),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.distance,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() => CustomTextfield(
                        hintText: '00Km',
                        obscureText: false,
                        controller: vm.distanceController.value,
                        focusNode: vm.distanceFocusNode.value,
                        isError: vm.distanceError.value,
                        onFieldSubmitted: (p0) {
                          Utils.fieldFocusChange(
                              context,
                              vm.distanceFocusNode.value,
                              vm.durationFocusNode.value);
                        },
                      )),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.duration,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => CustomTextfield(
                        controller: vm.durationController.value,
                        focusNode: vm.durationFocusNode.value,
                        isError: vm.durationError.value,
                        onFieldSubmitted: (p0) {
                          Utils.fieldFocusChange(
                              context,
                              vm.durationFocusNode.value,
                              vm.stepsFocusNode.value);
                        },
                        hintText: '00:00',
                        obscureText: false),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.steps,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => CustomTextfield(
                        controller: vm.stepsController.value,
                        focusNode: vm.stepsFocusNode.value,
                        isError: vm.stepsError.value,
                        onFieldSubmitted: (p0) {},
                        hintText: '0',
                        obscureText: false),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Obx(
                    () => PrimartyButton(
                        loading: vm.loading.value,
                        title: AppStrings.save,
                        width: MediaQuery.sizeOf(context).width * 0.75,
                        height: 12,
                        onTap: () async {
                          await vm.addWalk(doc['dogId']);
                        },
                        icon: ''),
                  ),
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
