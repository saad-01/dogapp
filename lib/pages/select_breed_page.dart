import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/view_models/breeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/styles.dart';

class SelectBreedPage extends StatefulWidget {
  const SelectBreedPage({super.key});

  @override
  State<SelectBreedPage> createState() => _SelectBreedPageState();
}

class _SelectBreedPageState extends State<SelectBreedPage> {
  final breeds = Get.put(Breeds());
  final RxString searchQuery = ''.obs;

  // Filtered list to hold the search results
  final RxList<String> filteredItems = <String>[].obs;
  @override
  void initState() {
    filterList('');
    super.initState();
  }

  // Function to filter the list based on search query
  void filterList(String query) {
    if (query.isEmpty) {
      // If search query is empty, show all items
      filteredItems.assignAll(breeds.dogBreeds);
    } else {
      List<String> filteredItem = <String>[].obs;
      // Filter items based on search query
      print(query);
      filteredItem.assignAll(breeds.dogBreeds
          .where((breed) => breed.toLowerCase().contains(query.toLowerCase())));
      filteredItems.value = filteredItem;
      filteredItem = [];
      print(filteredItems);
    }
  }

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.titleSelectBreed.tr),
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
                      // onSubmitted: (value) {
                      //   filterList(value);
                      // },
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
                        filteredItems[index],
                        style: Styles.expertSignupPaget1(),
                      ),
                      onTap: () {
                        // Add your onTap logic here
                        breeds.breed.value = filteredItems[index];

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
