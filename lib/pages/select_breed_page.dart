import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/styles.dart';
import '../view_models/add_dog_model.dart';

class SelectBreedPage extends StatefulWidget {
  const SelectBreedPage({super.key});

  @override
  State<SelectBreedPage> createState() => _SelectBreedPageState();
}

class _SelectBreedPageState extends State<SelectBreedPage> {
  final TextEditingController searchController = TextEditingController();
  final RxList<String> filteredItems = <String>[].obs;

  @override
  Widget build(BuildContext context) {
    final addDogVM = Get.put(AddDogModel());
    void filterList(String query) {
      filteredItems.assignAll(
        addDogVM.dogBreeds.where((item) => item.contains(query)),
      );
    }

    filteredItems.addAll(addDogVM.dogBreeds);
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.titleSelectBreed),
            Container(
              // width: 364,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0x3F737373)),
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
                children: [
                  SvgPicture.asset(AssetImages.search),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: false,
                      controller: searchController,
                      onChanged: (query) => filterList(query),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: Styles.expertSignupPaget2(),
                          hintText: 'Search'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        addDogVM.dogBreeds[index],
                        style: Styles.expertSignupPaget1(),
                      ),
                      onTap: () {
                        // Add your onTap logic here
                        addDogVM.breed.value = addDogVM.dogBreeds[index];
                        Get.back();
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      )),
    );
  }
}
