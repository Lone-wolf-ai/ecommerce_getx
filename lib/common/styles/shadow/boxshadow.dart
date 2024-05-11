import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';

class TShadowStyle {
  static  BoxShadow verticalProductShadow = BoxShadow(
    color: CustomColour.darkGrey.withOpacity(0.1),
    blurRadius: 50.0, // Use double for clarity
    spreadRadius: 7.0, // Use double for clarity
    offset: const Offset(0.0, 2.0), // Use double for clarity
  );

  static  BoxShadow horizontalProductShadow = BoxShadow(
    color: CustomColour.darkGrey.withOpacity(0.1),
    blurRadius: 50.0,
    spreadRadius: 7.0,
    offset: const Offset(0, 2.0), // Adjusted for horizontal offset
  );

  // You can add more shadow styles here...
}
