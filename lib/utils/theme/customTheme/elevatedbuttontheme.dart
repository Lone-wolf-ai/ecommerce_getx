import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';

class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._(); // Private constructor (unchanged)

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0.0, // Set elevation to 0.0 for flat button
      foregroundColor: Colors.white,
      backgroundColor: CustomColour.buttonPrimary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: CustomColour.buttonPrimary),
      padding:
          const EdgeInsets.symmetric(vertical: 18.0), // Add .0 for consistency
      textStyle: const TextStyle(
        fontSize: 16.0, // Add .0 for consistency
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Add .0 for consistency
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0.0, // Set elevation to 0.0 for flat button
      foregroundColor: Colors.white,
      backgroundColor: CustomColour.buttonPrimary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: CustomColour.buttonPrimary),
      padding:
          const EdgeInsets.symmetric(vertical: 18.0), // Add .0 for consistency
      textStyle: const TextStyle(
        fontSize: 16.0, // Add .0 for consistency
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Add .0 for consistency
      ),
    ),
  );
}
