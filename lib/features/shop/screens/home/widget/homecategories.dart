import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/circleimage/circleimagetitle.dart';
import 'package:getx_ecommerce/features/shop/controllers/categorycontroller.dart';
import 'package:getx_ecommerce/features/shop/screens/subcatagories/subcatagories.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isloading.value) {
        return const Center(
          child: LinearProgressIndicator(),
        );
      }
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: categoryController.featuredCategories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return CustomImagetitle(
              ontap: () => Get.to(() => const SubCatagoriesScreen()),
              title: "Shoe Categoris",
              image: CustomImages.shoeIcon,
              textcolor: CustomColour.white,
            );
          },
        ),
      );
    });
  }
}
