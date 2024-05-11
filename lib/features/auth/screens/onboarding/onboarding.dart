import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/features/auth/controller/onboarding/onboarding_controller.dart';
import 'package:getx_ecommerce/features/auth/screens/onboarding/widgets/onboardingwidgets.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/text_strings.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OnBoardingController());
    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: [
            //pages
            PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                OnBoardingPage(
                  imagepath: CustomImages.onBoardingImage1,
                  title: CusTomTexts.onBoardingTitle1,
                  subtitle: CusTomTexts.onBoardingSubTitle1,
                ),
                OnBoardingPage(
                  imagepath: CustomImages.onBoardingImage2,
                  title: CusTomTexts.onBoardingTitle2,
                  subtitle: CusTomTexts.onBoardingSubTitle2,
                ),
                OnBoardingPage(
                  imagepath: CustomImages.onBoardingImage3,
                  title: CusTomTexts.onBoardingTitle3,
                  subtitle: CusTomTexts.onBoardingSubTitle3,
                ),
              ],
            ),
            //skipButton
            const OnBoardingSkipButton(),
            //dotNavigation
            const OnBoardingDotnavigation(),
            //nextbutton
            const OnboardingButton(),
          ],
        ),
      ),
    );
  }
}

