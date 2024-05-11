import 'package:flutter/material.dart';

class CustomOutlineBorder {
  CustomOutlineBorder._(); // Private constructor (unchanged)

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0.0, // Set elevation to 0.0 for flat button
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.black),
      textStyle: const TextStyle(
        fontSize: 16.0, // Add .0 for consistency
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0), // Add .0 for consistency
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0), // Add .0 for consistency
      ),
    ),
  );

    static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.white),
      textStyle: const TextStyle(
        fontSize: 16.0, // Add .0 for consistency
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0), // Add .0 for consistency
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0), // Add .0 for consistency
      ),
    ),
  );
}
