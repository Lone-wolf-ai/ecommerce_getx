import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/text/brandtitletext.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/enum.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.textColor,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TexCustomSizes.small,
    this.iconColor = CustomColour.primary,
  });

  final String title;
  final Color? textColor;
  final int maxLines;
  final TextAlign textAlign;
  final TexCustomSizes brandTextSize;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisSize: MainAxisSize.min, // Wraps content tightly
      //   mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: CustomSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: CustomSizes.iconXs,
        ),
      ],
    );
  }
}
