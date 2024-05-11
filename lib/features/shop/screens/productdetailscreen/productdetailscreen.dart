import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/imageicon/widget/productimageslider.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/customsection.dart';
import 'package:getx_ecommerce/features/shop/screens/productdetailscreen/widgets/bottomaddtocart.dart';
import 'package:getx_ecommerce/features/shop/screens/productdetailscreen/widgets/product_meta_data.dart';
import 'package:getx_ecommerce/features/shop/screens/productdetailscreen/widgets/productattribute.dart';
import 'package:getx_ecommerce/features/shop/screens/productreview/productreview.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:getx_ecommerce/utils/http/http_client.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //1- product image slider
           ProductImageSlider(dark: dark),
            //2- product details
            Padding(
              padding: const EdgeInsets.only(
                  right: CustomSizes.defaultSpace,
                  left: CustomSizes.defaultSpace,
                  bottom: CustomSizes.defaultSpace),
              child: Column(
                children: [
                  //rating and share
                  const RatingAndShare(),
                  //meta data
                  const ProductMetaData(),
                  //product attribute
                  const ProductAttribute(),
                  const SizedBox(
                    height: CustomSizes.spaceBtwSections,
                  ),
                  //checkoutbutton
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Check Out'),
                    ),
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwSections,
                  ),
                  //description
                  CustomSectionWidget(
                    title: 'Description',
                    showActionButton: false,
                    textcolor: THelperFunctions.isDarkMode(context)
                        ? CustomColour.white
                        : CustomColour.black,
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceltwItems,
                  ),
                  const ReadMoreText(
                    'hello',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'show more',
                    trimExpandedText: 'less',
                    moreStyle:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwSections,
                  ),
                  //reviews
                  const Divider(),
                  const SizedBox(
                    height: CustomSizes.spaceltwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSectionWidget(
                        showActionButton: false,
                        title: 'Reviews (199)',
                        textcolor: THelperFunctions.isDarkMode(context)
                            ? CustomColour.white
                            : CustomColour.black, 
                      ),
                      IconButton(
                          onPressed: () => Get.to(() => const ProductReview()),
                          icon: const Icon(Iconsax.arrow_right_3))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: CustomSizes.spaceltwItems / 2,
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                const TextSpan(text: "(199)")
              ]),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            size: CustomSizes.iconMd,
          ),
        ),
      ],
    );
  }
}
