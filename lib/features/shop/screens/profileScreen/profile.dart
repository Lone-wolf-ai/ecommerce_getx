import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/common/circleimage/circularimage.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/customsection.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const CircularImage(
                      imagepath: CustomImages.user,
                      width: 80,
                      height: 80,
                      applydark: false,
                    ),
                    TextButton(
                      onPressed: () {},
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
              ProfileMenue(
                title: 'Name',
                onPressed: () {},
                value: 'Tanjim',
              ),
              // Assuming you have a ProfileMenu widget defined elsewhere

              ProfileMenue(
                  title: 'Username', value: 'coding_with_t', onPressed: () {}),
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

              ProfileMenue(
                title: 'User ID',
                value: '45689',
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              ProfileMenue(
                  title: 'E-mail', value: 'coding_with_t', onPressed: () {}),
              ProfileMenue(
                  title: 'Phone Number',
                  value: '+92-317-8059528',
                  onPressed: () {}),
              ProfileMenue(title: 'Gender', value: 'Male', onPressed: () {}),
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
                    onPressed: () {},
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
