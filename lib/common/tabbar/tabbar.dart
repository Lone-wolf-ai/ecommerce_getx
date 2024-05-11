import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/device/device_utility.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final bool isDark = THelperFunctions.isDarkMode(context);

    return Material(
      color: isDark ? CustomColour.black : CustomColour.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: CustomColour.primary,
        labelColor: isDark ? CustomColour.white : CustomColour.primary,
        unselectedLabelColor: CustomColour.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(CustomDeviceUtils.getAppBarHeight());
}
