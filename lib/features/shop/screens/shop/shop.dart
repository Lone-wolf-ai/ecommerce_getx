import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/common/imageicon/customcarticon/customcarticon.dart';
import 'package:getx_ecommerce/common/searchbarcontainer/customsearchbar.dart';
import 'package:getx_ecommerce/common/tabbar/tabbar.dart';
import 'package:getx_ecommerce/common/widgets/brandcard.dart';
import 'package:getx_ecommerce/common/widgets/brandshowcase.dart';
import 'package:getx_ecommerce/features/shop/controllers/categorycontroller.dart';
import 'package:getx_ecommerce/features/shop/models/categorymodel.dart';
import 'package:getx_ecommerce/features/shop/screens/allbrandscreen/allbradnscreen.dart';
import 'package:getx_ecommerce/features/shop/screens/home/homescreen.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/customsection.dart';
import 'package:getx_ecommerce/common/widgets/card/productcardvertical.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories=CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: CustomAppBar(
          showBackArrow: false,
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CustomCartCounteIcon(
                color: THelperFunctions.isDarkMode(context)
                    ? CustomColour.white
                    : CustomColour.black,
                onPressed: () {})
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, isScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  expandedHeight: 440,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? CustomColour.black
                      : CustomColour.white,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(CustomSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(
                          height: CustomSizes.spaceltwItems,
                        ),
                        const CustomSearchBarContainer(
                          text: "Search in Store",
                          showBorder: true,
                          pad: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: CustomSizes.spaceBtwSections,
                        ),
                        //--featured brand
                        CustomSectionWidget(
                          title: 'Featured Brands',
                          textcolor: THelperFunctions.isDarkMode(context)?CustomColour.white:CustomColour.black,
                          onPressed: ()=>Get.to(()=>const AllBrandsScreen()),
                        ),
                        const SizedBox(
                          height: CustomSizes.spaceltwItems / 1.5,
                        ),
                        //brand grid
                        ProductCardGrid(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const BrandCard(
                                showBorder: true,
                              );
                            })
                        // TRoundedContainer
                      ],
                    ),
                  ),
                  bottom:  TTabBar(
                    tabs: categories.map((element) => Tab(text: element.name,)).toList()
                  ))
            ];
          },
          body:  TabBarView(
            children: categories.map((element) => TabCatagory(category: element)).toList(),
          ),
        ),
      ),
    );
  }
}

class TabCatagory extends StatelessWidget {
  const TabCatagory({
    super.key, required this.category,
  });
final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              const BrandShowCase(
                images: [
                  CustomImages.productImage1,
                  CustomImages.productImage2,
                  CustomImages.productImage3,
                  CustomImages.productImage10,
                ],
              ),
              const SizedBox(
                height: CustomSizes.spaceltwItems,
              ),
              CustomSectionWidget(
                title: 'You might like',
                onPressed: () {},
              ),
              const SizedBox(
                height: CustomSizes.spaceltwItems,
              ),
              ProductCardGrid(
                  itemCount: 4,
                  itemBuilder: (_, index) => const ProductCartVertical())
            ],
          ),
        )
      ],
    );
  }
}
