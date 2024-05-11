import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/theme/customTheme/appBarTheme.dart';
import 'package:getx_ecommerce/utils/theme/customTheme/bottomsheettheme.dart';
import 'package:getx_ecommerce/utils/theme/customTheme/checkboxtheme.dart';
import 'package:getx_ecommerce/utils/theme/customTheme/clip_theme.dart';
import 'package:getx_ecommerce/utils/theme/customTheme/customtheme.dart';
import 'package:getx_ecommerce/utils/theme/customTheme/elevatedbuttontheme.dart';
import 'package:getx_ecommerce/utils/theme/customTheme/outlinebuttontheme.dart';
import 'package:getx_ecommerce/utils/theme/customTheme/textfieldtheme.dart';

class CustomThemeData {
  CustomThemeData._();

  static ThemeData lightheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: const Color(0xFF3a58cc),
      scaffoldBackgroundColor: Colors.white,
      textTheme: CustomTextTheme.lightTextTheme,
      chipTheme: CustomChipTheme.lightChipTheme,
      appBarTheme: CustomAppBarTheme.lightAppBorTheme,
      checkboxTheme: CustomCheckBox.lightCheckboxTheme,
      bottomSheetTheme: CustomButtomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: CustomOutlineBorder.lightOutlinedButtonTheme,
      inputDecorationTheme:
          CustomInputDecorationTheme.lightInputDecorationTheme);

  static ThemeData darktheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: const Color(0xFF3a58cc),
      scaffoldBackgroundColor:  CustomColour.black,
      textTheme: CustomTextTheme.darkTextTheme,
      chipTheme: CustomChipTheme.darkChipTheme,
      appBarTheme: CustomAppBarTheme.darkAppBorTheme,
      checkboxTheme: CustomCheckBox.darkCheckboxTheme,
      bottomSheetTheme: CustomButtomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: CustomOutlineBorder.darkOutlinedButtonTheme,
      inputDecorationTheme:
          CustomInputDecorationTheme.darkInputDecorationTheme);
}
