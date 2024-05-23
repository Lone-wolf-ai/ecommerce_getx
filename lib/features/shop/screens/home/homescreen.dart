import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/searchbarcontainer/customsearchbar.dart';
import 'package:getx_ecommerce/features/shop/screens/allproducts/all_products.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/customsection.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/homeappbar.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/homecategories.dart';
import 'package:getx_ecommerce/common/widgets/customcurvedwidget.dart';
import 'package:getx_ecommerce/common/widgets/card/productcardvertical.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/promoslider.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomCurvedWidget(
              child: Column(
                children: [
                  //appbar
                  HomeAppBar(),
                  //searchbar
                  CustomSearchBarContainer(
                    text: 'Search in store',
                  ),
                  SizedBox(
                    height: CustomSizes.spaceBtwSections,
                  ),
                  //catagories
                  Padding(
                    padding: EdgeInsets.only(left: CustomSizes.defaultSpace),
                    child: Column(
                      children: [
                        CustomSectionWidget(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: CustomSizes.spaceBtwSections,
                        ),
                        //categoris
                        HomeCategoriesWidget(),
                        SizedBox(
                          height: CustomSizes.defaultSpace,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            //body
            const Padding(
              padding: EdgeInsets.all(CustomSizes.defaultSpace),
              child: PromoSlider(
                banners: [
                  CustomImages.banner1,
                  CustomImages.banner2,
                  CustomImages.banner3,
                  CustomImages.banner4
                ],
              ),
            ),
          
            //product card vertical
            Padding(
              padding: const EdgeInsets.only(
                  left: CustomSizes.md,
                  right: CustomSizes.md,
                  bottom: CustomSizes.dividerHeight),
              child: CustomSectionWidget(
                onPressed: () => Get.to(() => const AllProducts()),
                title: 'Popupalr Products',
                textcolor: THelperFunctions.isDarkMode(context)
                    ? CustomColour.textWhite
                    : CustomColour.black,
              ),
            ),
            ProductCardGrid(
              itemCount: 10,
              itemBuilder: (_, n) => const ProductCartVertical(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCardGrid extends StatelessWidget {
  const ProductCardGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 290,
  });
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: CustomSizes.gridViewSpacing,
        crossAxisSpacing: CustomSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
        crossAxisCount: 2,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
