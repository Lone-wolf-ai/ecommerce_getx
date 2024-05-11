import 'package:flutter/cupertino.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';

class Customcirclebox extends StatelessWidget {
  const Customcirclebox({
    super.key,
    this.width = 400,
    this.height = 400,
    this.color = CustomColour.white,
    this.margin ,
    this.padding = 0,
    this.child,
    this.radius = 400,
  });
  final double width;
  final double height;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final double radius;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding:  EdgeInsets.all(padding),
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: child,);
        
  }
}
