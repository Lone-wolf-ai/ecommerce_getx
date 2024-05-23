import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/features/auth/controller/signup/signup_controller.dart';
import 'package:getx_ecommerce/features/auth/screens/login/widgets/login_widgets.dart';
import 'package:getx_ecommerce/features/auth/screens/signup/widgets/signupWidgets.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/constants/text_strings.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Ensure children fill the width
            children: [
              Text(
                CusTomTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),

              //form
              const CustomForm(),


              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              //term and condition
              TermAndCondition(dark: dark),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              //create account button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text("Create Account"),
                  onPressed: () =>controller.signup(),
                ),
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              //signup divider
              CustomDivider(
                dark: dark,
                title: CusTomTexts.orSignUpWith,
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              //thirdparty button
              const ThirdPartyLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
