import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key, this.imagepath=CustomImages.clothIcon, this.width=56, this.height=56,  this.padding=CustomSizes.sm, this.applydark=true,
  });
 final String imagepath;
 final double width;
 final double height;
 final double padding;
 final bool applydark;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: THelperFunctions.isDarkMode(context)
            ? CustomColour.black
            : CustomColour.white,
        borderRadius: BorderRadius.circular(100),
      ), // BoxDecoration
      child: Image(
        image:  AssetImage(imagepath),
        color:applydark? (THelperFunctions.isDarkMode(context)
            ? CustomColour.white
            : CustomColour.dark):null,
      ), // Image
    );
  }
}
