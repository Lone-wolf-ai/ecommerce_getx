import 'package:flutter/material.dart';
import 'package:getx_ecommerce/features/auth/controller/onboarding/onboarding_controller.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/device/device_utility.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: CustomSizes.defaultSpace,
      bottom: CustomDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: ()=>OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          side: const BorderSide(width: 0),
            shape: const CircleBorder(), backgroundColor:dark?CustomColour.buttonPrimary: Colors.black),
        child: const Icon(Icons.keyboard_arrow_right),
      ),
    );
  }
}

class OnBoardingDotnavigation extends StatelessWidget {
  const OnBoardingDotnavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: CustomDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: CustomSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? CustomColour.light : CustomColour.dark,
            dotHeight: 6),
      ),
    );
  }
}

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: CustomDeviceUtils.getAppBarHeight(),
      right: CustomSizes.defaultSpace,
      child: TextButton(
        onPressed: ()=>OnBoardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final String imagepath;
  final String title;
  final String subtitle;
  const OnBoardingPage({
    super.key,
    required this.imagepath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CustomSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: THelperFunctions.screenWidth(context) * 0.8,
            height: THelperFunctions.screenHeight() * 0.6,
            image: AssetImage(imagepath),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: CustomSizes.spaceltwItems,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
