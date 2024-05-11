import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getx_ecommerce/common/imageicon/customimage/customimage.dart';
import 'package:getx_ecommerce/common/styles/shadow/boxshadow.dart';
import 'package:getx_ecommerce/common/styles/shape/container/roundedcontainer.dart';
import 'package:getx_ecommerce/common/text/brandtitleverifiedicon.dart';
import 'package:getx_ecommerce/common/text/product_tiltle_text.dart';
import 'package:getx_ecommerce/common/widgets/card/productcardvertical.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/productpricetext.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CustomSizes.productImageRadius),
          color: dark ? CustomColour.darkerGrey : CustomColour.softGrey),
      child: Row(
        children: [
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(CustomSizes.sm),
            backgroundColor: dark ? CustomColour.dark : CustomColour.white,
            child: Stack(
              children: [
                const SizedBox(
                    height: 120,
                    width: 120,
                    child: RoundedImage(
                      backgroundColor: CustomColour.white,
                      imageUrl: CustomImages.productImage1,
                      applyImageRadius: true,
                    )), //sale tag
                const SalesTag(),
                //favorite icon
                FavIcon(
                  dark: dark,
                  icon: Iconsax.heart5,
                  onpress: () {},
                  color: Colors.red,
                )
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: CustomSizes.sm, left: CustomSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(
                          title: 'Green Nike Half Sleeves Shirt',
                          isSmallSize: true),
                      SizedBox(height: CustomSizes.spaceltwItems / 2),
                      TBrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: ProductPriceText(price: '256.6'),
                      ),

                      /// Add to Cart Button
                      Container(
                        decoration: const BoxDecoration(
                          color: CustomColour.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(CustomSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(CustomSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: CustomSizes.iconLg * 1.2,
                          height: CustomSizes.iconLg * 1.2,
                          child: Center(
                              child:
                                  Icon(Iconsax.add, color: CustomColour.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
