import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class CircurIcon extends StatelessWidget {
  const CircurIcon({
    super.key,
    this.child,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(0.0),
    this.showBorder = false,
    this.backgroundColor,
    this.borderColor = CustomColour.borderprimary,
    this.size = CustomSizes.lg, this.color, this.onpress, required this.icon,
  });

  final Widget? child;
  final double? width, size;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool showBorder;
  final double radius=100;
  final Color? backgroundColor,color;
  final Color borderColor;
  final VoidCallback? onpress;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor != null
              ? backgroundColor!
              : THelperFunctions.isDarkMode(context)
                  ? CustomColour.black.withOpacity(0.9)
                  : CustomColour.light,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: IconButton(onPressed: onpress, icon: Icon(icon,color:color,size: size,)));
  }
}
