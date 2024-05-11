import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    required this.dark,
    required this.icon,
    required this.color,
    required this.onpress,
  });

  final bool dark;
  final IconData icon;
  final Color? color;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: dark
              ? CustomColour.black.withOpacity(0.9)
              : CustomColour.white.withOpacity(0.9)),
      child: IconButton(
        onPressed: onpress,
        icon: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}