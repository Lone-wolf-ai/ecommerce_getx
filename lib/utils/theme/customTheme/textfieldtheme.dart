import 'package:flutter/material.dart';

class CustomInputDecorationTheme {
  CustomInputDecorationTheme._(); // Private constructor (unchanged)

  static final lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    // constraints: const BoxConstraints.expand(height: 14.0), // Add .0 for consistency (optional)
    labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(width: 1.0, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(width: 1.0, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(width: 1.0, color: Colors.black12),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(width: 1.0, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(width: 2.0, color: Colors.orange),
    ),
  );

  static final darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2, // Adjust for dark theme preference
    prefixIconColor: Colors.white70, // Use a lighter grey for better contrast
    suffixIconColor: Colors.white70,
    labelStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14.0, color: Colors.white54), // Use a slightly transparent white
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(width: 1.0, color: Colors.white70),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(width: 1.0, color: Colors.white70),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(width: 1.0, color: Colors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(width: 1.0, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(width: 2.0, color: Colors.orange),
    ),
  );
}
