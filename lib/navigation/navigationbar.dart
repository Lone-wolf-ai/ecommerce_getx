import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/features/shop/screens/favoorite/favoritescreen.dart';
import 'package:getx_ecommerce/features/shop/screens/home/homescreen.dart';
import 'package:getx_ecommerce/features/shop/screens/setting/settings.dart';
import 'package:getx_ecommerce/features/shop/screens/shop/shop.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class NavigationBarMenue extends StatelessWidget {
  const NavigationBarMenue({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (value) =>
              controller.selectedIndex.value = value,
          backgroundColor: dark ? Colors.black : Colors.white,
          indicatorColor: dark
              ? CustomColour.white.withOpacity(0.1)
              : CustomColour.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Shop'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile')
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const ShopScreen(),
    const FavouriteScreen(),
    const SettingScreen()
  ];
}
 