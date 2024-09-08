import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/select_field.dart';
import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_models/select_expert_model.dart';

class AddExpertPage extends StatefulWidget {
  const AddExpertPage({super.key});

  @override
  State<AddExpertPage> createState() => _AddExpertPageState();
}

class _AddExpertPageState extends State<AddExpertPage> {
  // final expertVM = Get.put(ExpertSignupModel());
  final formkey = GlobalKey<FormState>();
  final SelectExpertModel expertVM = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              CustomAppBar(title: AppStrings.addExpert.tr),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.expertName.tr,
                  style: Styles.expertSignupPaget1(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => CustomTextfield(
                  hintText: AppStrings.expertName.tr,
                  obscureText: false,
                  isError: expertVM.nameError.value,
                  controller: expertVM.nameController.value,
                  focusNode: expertVM.nameFocusNode.value,
                  onFieldSubmitted: (p0) {
                    if (p0.isEmpty) {
                      expertVM.nameError.value = true;
                    } else {
                      expertVM.nameError.value = false;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.yourNumber.tr,
                      style: Styles.expertSignupPaget1())),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => CustomTextfield(
                  hintText: AppStrings.yourNumber.tr,
                  obscureText: false,
                  isError: expertVM.numberError.value,
                  controller: expertVM.numberController.value,
                  focusNode: expertVM.numberFocusNode.value,
                  onFieldSubmitted: (p0) {
                    if (p0.isEmpty) {
                      expertVM.numberError.value = true;
                    } else {
                      expertVM.numberError.value = false;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(AppStrings.expertQualification.tr,
                    style: Styles.expertSignupPaget1()),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextfield(
                hintText: AppStrings.expertQualification.tr,
                obscureText: false,
                controller: expertVM.qualificationController.value,
                focusNode: expertVM.qualificationFocusNode.value,
                onFieldSubmitted: (p0) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(AppStrings.expertSpeciality.tr,
                    style: Styles.expertSignupPaget1()),
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => SelectTextfield(
                  hintText: AppStrings.expertSpeciality.tr,
                  isError: expertVM.specialityError.value,
                  val: expertVM.speciality.value,
                  items: [
                    DropdownMenuItem(
                        value: 'Training',
                        onTap: () {
                          expertVM.speciality.value = 'Training';
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.trainExpert.tr),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        )),
                    DropdownMenuItem(
                        value: 'Physiotherapists',
                        onTap: () {
                          expertVM.speciality.value = 'Physiotherapists';
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.physioExpert.tr),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        )),
                    DropdownMenuItem(
                        value: 'Nutritionists',
                        onTap: () {
                          expertVM.speciality.value = 'Nutritionists';
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.nutriExpert.tr),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        )),
                    DropdownMenuItem(
                        value: 'Veterinarians',
                        onTap: () {
                          expertVM.speciality.value = 'Veterinarians';
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.vetExpert.tr),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              // const Spacer(),   /
              const SizedBox(
                height: 60,
              ),
              Obx(() => PrimartyButton(
                    icon: '',
                    loading: expertVM.loading.value,
                    title: AppStrings.createButton.tr,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 10,
                    onTap: () async {
                      await expertVM.addExpert();
                      expertVM.setDataByMap(expertVM.map);
                    },
                  )),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
