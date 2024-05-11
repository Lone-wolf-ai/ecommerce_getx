import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';

class CustomChipTheme {
  CustomChipTheme._();
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: CustomColour.black),
    selectedColor: CustomColour.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  ); // ChipThemeData

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: CustomColour.darkGrey,
    labelStyle: TextStyle(color: CustomColour.white),
    selectedColor: CustomColour.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: CustomColour.white,
  );
}
