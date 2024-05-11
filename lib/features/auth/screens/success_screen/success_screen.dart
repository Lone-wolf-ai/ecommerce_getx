import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/styles/spacingstyle.dart';
import 'package:getx_ecommerce/features/auth/screens/login/login.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/constants/text_strings.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      this.image = CustomImages.staticSuccessIllustration,
      this.title=CusTomTexts.yourAccountCreatedTitle,
      this.subTitle=CusTomTexts.yourAccountCreatedSubTitle,
      required this.onPressed});
  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const isDarkMode = THelperFunctions.isDarkMode; // Check for dark mode

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              SpacingStyle.paddingWithAppBarHeight * 2, // Consistent padding
          child: Column(
            children: [
              // Image
              Lottie.asset(image,width: MediaQuery.of(context).size.width*0.6),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Title & Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CustomSizes.spaceltwItems),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode == true
                        ? Colors.white
                        : Theme.of(context)
                            .primaryColor, // Adjust button color based on theme
                  ),
                  child: const Text(CusTomTexts.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
