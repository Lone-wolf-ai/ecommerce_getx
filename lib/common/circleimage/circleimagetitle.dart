import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class CustomImagetitle extends StatelessWidget {
  const CustomImagetitle({
    super.key,
    required this.title,
    required this.image,
    required this.textcolor,
    this.backgroundColor,
    this.ontap,
  });
  final String title, image;
  final Color textcolor;
  final Color? backgroundColor;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(right:CustomSizes.spaceltwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(CustomSizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor??(THelperFunctions.isDarkMode(context)?CustomColour.black:CustomColour.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                  color: THelperFunctions.isDarkMode(context)?CustomColour.white:CustomColour.black,
                ),
              ),
            ),

            /// Text
            const SizedBox(height: CustomSizes.spaceltwItems / 2),
            SizedBox(
              width: 55,
              child: Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textcolor)),
            )
          ],
        ),
      ),
    );
  }
}