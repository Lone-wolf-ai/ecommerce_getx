import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class CustomCartCounteIcon extends StatelessWidget {
  const CustomCartCounteIcon({
    super.key,
    required this.color,
    required this.onPressed,
  });
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.shopping_bag, color: color),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: CustomColour.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: CustomColour.white,
                      fontSizeFactor: 0.8,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}