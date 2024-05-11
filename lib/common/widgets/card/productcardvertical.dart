import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/imageicon/customimage/customimage.dart';
import 'package:getx_ecommerce/common/styles/shadow/boxshadow.dart';
import 'package:getx_ecommerce/common/styles/shape/container/roundedcontainer.dart';
import 'package:getx_ecommerce/common/text/brandtitleverifiedicon.dart';
import 'package:getx_ecommerce/common/text/product_tiltle_text.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/productpricetext.dart';
import 'package:getx_ecommerce/features/shop/screens/productdetailscreen/productdetailscreen.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProductCartVertical extends StatelessWidget {
  const ProductCartVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        //margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(CustomSizes.productImageRadius),
            color: dark ? CustomColour.darkerGrey : CustomColour.white),
        child: Column(
          children: [
            //thumbnail image
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(CustomSizes.sm),
              backgroundColor: dark ? CustomColour.dark : CustomColour.light,
              child: Stack(
                children: [
                  const RoundedImage(
                    imageUrl: CustomImages.productImage1,
                    width: 200,
                  ),
                  //sale tag
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
            const SizedBox(
              height: CustomSizes.spaceltwItems / 2,
            ),
            const Padding(
              padding: EdgeInsets.only(left: CustomSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: 'Green Nike Air Shoes',
                    isSmallSize: true,
                  ),
                  SizedBox(
                    width: CustomSizes.spaceltwItems / 2,
                  ),
                  TBrandTitleWithVerifiedIcon(title: 'Nike')
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: CustomSizes.sm),
                  child: ProductPriceText(price: '50'),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: CustomColour.dark,
                    borderRadius: BorderRadius.only(
                      bottomRight:
                          Radius.circular(CustomSizes.productImageRadius),
                      topLeft: Radius.circular(CustomSizes.cardRadiusMd),
                    ),
                  ),
                  child: const SizedBox(
                    width: CustomSizes.iconLg * 1.2,
                    height: CustomSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: CustomColour.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FavIcon extends StatelessWidget {
  const FavIcon({
    super.key,
    required this.dark,
    required this.icon,
    required this.color,
    required this.onpress,
  });

  final bool dark;
  final IconData icon;
  final Color? color;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: dark
                ? CustomColour.black.withOpacity(0.9)
                : CustomColour.white.withOpacity(0.9)),
        child: IconButton(
          onPressed: onpress,
          icon: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}

class SalesTag extends StatelessWidget {
  const SalesTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      child: TRoundedContainer(
        radius: CustomSizes.sm,
        backgroundColor: CustomColour.secondary.withOpacity(0.8),
        padding: const EdgeInsets.symmetric(
            horizontal: CustomSizes.sm, vertical: CustomSizes.xs),
        child: Text(
          '25%',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .apply(color: CustomColour.black),
        ),
      ),
    );
  }
}
