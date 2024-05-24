import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.imagepath = CustomImages.clothIcon,
    this.width = 56,
    this.height = 56,
    this.padding = CustomSizes.sm,
    this.applydark = true,
    this.isnetworkimg = false,
    this.overlaycolor,
    this.fit,
  });
  final String imagepath;
  final double width;
  final double height;
  final double padding;
  final bool applydark;
  final bool isnetworkimg;
  final Color? overlaycolor;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: THelperFunctions.isDarkMode(context)
            ? CustomColour.black
            : CustomColour.white,
        borderRadius: BorderRadius.circular(100),
      ), // BoxDecoration
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isnetworkimg
              ? CachedNetworkImage(
                  imageUrl: imagepath,
                  fit: fit,
                  color: overlaycolor,
                  errorWidget: (_, __, ___) => const Icon(Icons.error),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Image(
                  image: AssetImage(imagepath),
                  color: applydark
                      ? (THelperFunctions.isDarkMode(context)
                          ? CustomColour.white
                          : CustomColour.dark)
                      : null,
                ),
        ),
      ), // Image
    );
  }
}
