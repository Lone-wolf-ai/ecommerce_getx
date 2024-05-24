import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/common/circleimage/circularimage.dart';
import 'package:getx_ecommerce/features/personalization/controllers/usercontroller.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/customsection.dart';
import 'package:getx_ecommerce/features/shop/screens/setting/settingsfeature/screen/changename.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkimg=controller.user.value.profilePic;
                      final img=networkimg.isNotEmpty?networkimg:CustomImages.user;
                      return controller.imguploading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          :  CircularImage(
                              imagepath: img,
                              isnetworkimg:networkimg.isNotEmpty?true:false ,
                              width: 80,
                              height: 80,
                              applydark: false,
                            );
                    }),
                    TextButton(
                      onPressed: ()=>controller.uploadUserProfilePicture(),
                      child: const Text("Change Profile Picture"),
                    )
                  ],
                ),
              ),
              //details
              const SizedBox(
                height: CustomSizes.spaceltwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: CustomSizes.spaceltwItems,
              ),
              CustomSectionWidget(
                title: 'Profile Information',
                showActionButton: false,
                textcolor: THelperFunctions.isDarkMode(context)
                    ? CustomColour.white
                    : CustomColour.black,
              ),
              const SizedBox(
                height: CustomSizes.spaceltwItems,
              ),
              Obx(
                () => ProfileMenue(
                  title: 'Name',
                  onPressed: () => Get.to(() => const ChangeName()),
                  value:
                      '${controller.user.value.firstname} ${controller.user.value.lastname}',
                ),
              ),
              // Assuming you have a ProfileMenu widget defined elsewhere

              Obx(
                () => ProfileMenue(
                    title: 'Username',
                    value: controller.user.value.username,
                    onPressed: () {}),
              ),
              const SizedBox(
                  height: CustomSizes
                      .spaceltwItems), // Use const for constant spacing
              const Divider(), // Use const for static dividers
              const SizedBox(height: CustomSizes.spaceltwItems),

// Personal Information Section
              const CustomSectionWidget(
                  title: 'Personal Information',
                  showActionButton:
                      false), // Changed TSectionHeading to ProfileMenuHeading
              const SizedBox(
                  height: CustomSizes
                      .spaceltwItems), // Use const for constant spacing

              Obx(
                () => ProfileMenue(
                  title: 'User ID',
                  value: controller.user.value.id,
                  onPressed: () {},
                  icon: Iconsax.copy,
                ),
              ),
              Obx(
                () => ProfileMenue(
                    title: 'E-mail',
                    value: controller.user.value.email,
                    onPressed: () {}),
              ),
              Obx(
                () => ProfileMenue(
                    title: 'Phone Number',
                    value: controller.user.value.phoneNumber,
                    onPressed: () {}),
              ),
              Obx(
                () => ProfileMenue(
                    title: 'Gender',
                    value: controller.user.value.firstname,
                    onPressed: () {}),
              ),
              ProfileMenue(
                  title: 'Date of Birth',
                  value: '10 Oct, 1994',
                  onPressed: () {}),
              const Divider(),
              const SizedBox(
                height: CustomSizes.spaceltwItems,
              ),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text(
                      'Closed Account',
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenue extends StatelessWidget {
  const ProfileMenue({
    super.key,
    this.icon = Iconsax.arrow_right_34,
    required this.onPressed,
    required this.title,
    required this.value,
  });
  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: CustomSizes.spaceltwItems / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(child: Icon(icon, size: 18)),
          ],
        ),
      ),
    );
  }
}
