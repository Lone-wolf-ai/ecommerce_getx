import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/common/circleimage/circularimage.dart';
import 'package:getx_ecommerce/common/settingsmenue/settingbar.dart';
import 'package:getx_ecommerce/common/widgets/primaryheadercontainer.dart';
import 'package:getx_ecommerce/features/shop/screens/orderscreen/orderscreen.dart';
import 'package:getx_ecommerce/features/shop/screens/address/adress.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/customsection.dart';
import 'package:getx_ecommerce/features/shop/screens/profileScreen/profile.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  CustomAppBar(
                    showBackArrow: false,
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: CustomColour.white),
                    ),
                  ),
                  ListTile(
                    leading: const CircularImage(
                      imagepath: CustomImages.user,
                      width: 50,
                      height: 50,
                      padding: 0,
                      applydark: false,
                    ),
                    title: Text(
                      "tanjim",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: CustomColour.white),
                    ),
                    subtitle: Text(
                      'email',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: CustomColour.white),
                    ),
                    trailing: IconButton(
                        onPressed: () => Get.to(() => const ProfilScreen()),
                        icon: const Icon(
                          Iconsax.edit,
                          color: CustomColour.white,
                        )),
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            //body
            Padding(
              padding: const EdgeInsets.all(CustomSizes.defaultSpace),
              child: Column(
                children: [
                  CustomSectionWidget(
                    textcolor: THelperFunctions.isDarkMode(context)?CustomColour.white:CustomColour.black,
                    title: "Account Settings",
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceltwItems,
                  ),
                   SettingsMenuTile(
                    onTap: ()=>Get.to(()=>const AddressScreen()),
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subtitle: 'Set shopping delivery address'),
                  const SettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subtitle: 'Add, remove products and move to checkout'),
                   SettingsMenuTile(
                    onTap: () => Get.to(()=>const OrderScreen()),
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subtitle: 'In-progress and Completed Orders'),
                  const SettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subtitle: 'Withdraw balance to registered bank account'),
                  const SettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subtitle: 'List of all the discounted coupons'),
                  const SettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subtitle: 'Set any kind of notification message'),
                  const SettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subtitle: 'Manage data usage and connected accounts'),

                  /// App Settings

                  CustomSectionWidget(
                    title: "Account Settings",
                    onPressed: () {},
                  ),
                  const SizedBox(height: CustomSizes.spaceltwItems),
                  const SettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subtitle: 'Upload Data to your Cloud Firebase'),

                  SettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ), // TSettingsMenuTile
                  SettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ), // TSettingsMenuTile
                  SettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text("Log out")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
