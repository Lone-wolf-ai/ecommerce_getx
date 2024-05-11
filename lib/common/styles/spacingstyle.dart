import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';

class SpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight=EdgeInsets.only(
    top: CustomSizes.appBarHeight,
    left: CustomSizes.defaultSpace,
    bottom: CustomSizes.defaultSpace,
    right: CustomSizes.defaultSpace,
  );

}