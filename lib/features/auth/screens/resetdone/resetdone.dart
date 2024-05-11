import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/constants/text_strings.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: const AssetImage(CustomImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth(context) * 0.6,
              ),
              const SizedBox(height:CustomSizes.spaceBtwSections),

              // Title & Subtitle
              Text(
                CusTomTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CustomSizes.spaceltwItems),
              Text(
                CusTomTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(CusTomTexts.done),
                ),
              ),
              const SizedBox(height: CustomSizes.spaceltwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(CusTomTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
