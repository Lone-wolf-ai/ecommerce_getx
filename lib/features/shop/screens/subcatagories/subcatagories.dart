import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/common/imageicon/customimage/customimage.dart';
import 'package:getx_ecommerce/common/widgets/card/productcardhorizontal.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/customsection.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class SubCatagoriesScreen extends StatelessWidget {
  const SubCatagoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Sports'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              const RoundedImage(
                imageUrl: CustomImages.promoBanner1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              Column(
                children: [
                  CustomSectionWidget(
                    textcolor:dark?CustomColour.textWhite:CustomColour.black,
                    title: 'Sports shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceltwItems,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => const ProductCardHorizontal(),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: CustomSizes.spaceltwItems,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
