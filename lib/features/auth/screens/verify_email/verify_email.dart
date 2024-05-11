import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/features/auth/controller/signup/verifycontroller.dart';
import 'package:getx_ecommerce/features/auth/screens/login/login.dart';
import 'package:getx_ecommerce/features/auth/screens/success_screen/success_screen.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              //image
              const Image(
                image: AssetImage(CustomImages.deliveredEmailIllustration),
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              //title and subtitle
              Text(
                CusTomTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CustomSizes.spaceltwItems,
              ),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CustomSizes.spaceltwItems,
              ),
              Text(
                CusTomTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text(CusTomTexts.tContinue),
                  onPressed: () => controller.checkEmailVerificationStatus(),
                ),
              ),
              const SizedBox(
                height: CustomSizes.spaceltwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: const Text(CusTomTexts.resendEmail),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
