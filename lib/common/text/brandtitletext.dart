import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/enum.dart';

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText({
    super.key,
    required this.title,
    this.color,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TexCustomSizes.small,
  });

  final String title;
  final Color? color;
  final int maxLines;
  final TextAlign textAlign;
  final TexCustomSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodyMedium!.apply(color: color);

    switch (brandTextSize) {
      case TexCustomSizes.small:
        textStyle = Theme.of(context).textTheme.labelMedium!.apply(color: color);
        break;
      case TexCustomSizes.medium:
        textStyle = Theme.of(context).textTheme.bodyLarge!.apply(color: color);
        break;
      case TexCustomSizes.large:
        textStyle = Theme.of(context).textTheme.titleLarge!.apply(color: color);
        break;
      default:
        // Add logic for any additional sizes or fallback behavior
        break;
    }

    return Text(
      title,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

enum TextSizes { small, medium, large } // Assuming this defines your enum
