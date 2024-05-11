import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/common/gridlayout/gridlayout.dart';
import 'package:getx_ecommerce/common/widgets/brandcard.dart';
import 'package:getx_ecommerce/common/widgets/soratable/sortable.dart';
import 'package:getx_ecommerce/features/shop/screens/brandproducts/brandproducts.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/customsection.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              // Brand heading
              CustomSectionWidget(title: 'Brands', showActionButton: false,textcolor:dark?CustomColour.textWhite:CustomColour.black ,),
              const SizedBox(height: CustomSizes.spaceltwItems),

              // Grid of brand cards
              GridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => BrandCard(
                  showBorder: true,
                  ontap: () => Get.to(() => const BrandProducts()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
