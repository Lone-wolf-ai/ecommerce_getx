import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/device/device_utility.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearchBarContainer extends StatelessWidget {
  const CustomSearchBarContainer({
    super.key,
    required this.text,
    this.ontap,
    this.icon = Iconsax.search_normal,
    this.showbackground = true,
    this.showBorder = true,
    this.pad = const EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace),
  });
  final void Function()? ontap;
  final String text;
  final IconData? icon;
  final bool showbackground, showBorder;
  final EdgeInsetsGeometry pad;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: pad,
        child: Container(
          width: CustomDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(CustomSizes.md),
          decoration: BoxDecoration(
            color: showbackground
                ? dark
                    ? CustomColour.dark
                    : CustomColour.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: CustomColour.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: CustomColour.darkerGrey),
              const SizedBox(width: CustomSizes.spaceltwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
