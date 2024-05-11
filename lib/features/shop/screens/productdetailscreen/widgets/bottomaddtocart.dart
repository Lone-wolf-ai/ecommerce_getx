import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getx_ecommerce/common/circleimage/circularimage.dart';
import 'package:getx_ecommerce/common/styles/shape/container/circlecontainer.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CustomSizes.defaultSpace,
          vertical: CustomSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(CustomSizes.cardRadiusLg),
              topRight: Radius.circular(CustomSizes.cardRadiusLg)),
          color: dark ? CustomColour.darkerGrey : CustomColour.light),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Customcirclebox(
                color: CustomColour.darkGrey,
                width: 40,
                height: 40,
                child: Icon(
                  Iconsax.minus,
                  color: CustomColour.white,
                ),
              ),
              const SizedBox(
                width: CustomSizes.spaceltwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                width: CustomSizes.spaceltwItems,
              ),
              const Customcirclebox(
                color: CustomColour.black,
                width: 40,
                height: 40,
                child: Icon(
                  Iconsax.add,
                  color: CustomColour.white,
                ),
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(CustomSizes.md),
                backgroundColor: CustomColour.black,
                side: const BorderSide(color: CustomColour.black)),
            child: const Text('Add to cart'),
          )
        ],
      ),
    );
  }
}
