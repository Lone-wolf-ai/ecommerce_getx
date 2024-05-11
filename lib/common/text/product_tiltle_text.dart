import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.title,
    this.isSmallSize = false, // Use isSmallSize for clarity
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool isSmallSize; // Use isSmallSize for clarity
  final int maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: isSmallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall, // Consistent style access
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
