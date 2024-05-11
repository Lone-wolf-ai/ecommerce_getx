import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/common/imageicon/customcarticon/circleicon.dart';
import 'package:getx_ecommerce/common/imageicon/customimage/customimage.dart';
import 'package:getx_ecommerce/common/widgets/customcurvedwidget.dart';
import 'package:getx_ecommerce/common/widgets/card/productcardvertical.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return CustomCurvedWidget(
        child: Container(
      color: dark ? CustomColour.darkGrey : CustomColour.light,
      child: Stack(
        children: [
          const SizedBox(
            height: 400,
            child: Padding(
              padding:
                  EdgeInsets.all(CustomSizes.productImageRadius * 2),
              child: Center(
                  child: Image(
                      image: AssetImage(CustomImages.productImage1))),
            ),
          ),
          //image slider
    
          Positioned(
            right: 0,
            bottom: 30,
            left: CustomSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: CustomSizes.spaceltwItems,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return RoundedImage(
                    imageUrl: CustomImages.productImage1,
                    border: Border.all(color: CustomColour.primary),
                    padding: const EdgeInsets.all(CustomSizes.sm),
                    width: 80,
                    backgroundColor:
                        dark ? CustomColour.dark : CustomColour.light,
                  );
                },
              ),
            ),
          ),
          CustomAppBar(
            actions: [
              CircleIcon(
                  dark: dark,
                  icon: Iconsax.heart5,
                  color: Colors.red,
                  onpress: () {})
            ],
          )
        ],
      ),
    ));
  }
}
