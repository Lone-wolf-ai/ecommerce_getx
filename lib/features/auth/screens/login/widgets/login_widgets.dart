import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/features/auth/screens/forgetpassword/forgetpassword.dart';
import 'package:getx_ecommerce/features/auth/screens/signup/signup.dart';
import 'package:getx_ecommerce/navigation/navigationbar.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class ThirdPartyLogin extends StatelessWidget {
  const ThirdPartyLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: CustomColour.grey)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: CustomSizes.iconMd,
              height: CustomSizes.iconMd,
              image: AssetImage(CustomImages.google),
            ),
          ),
        ),
        const SizedBox(
          width: CustomSizes.spaceltwItems,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: CustomColour.grey)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: CustomSizes.iconMd,
              height: CustomSizes.iconMd,
              image: AssetImage(CustomImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.dark, required this.title,
  });
  final String title;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: dark ? CustomColour.darkGrey : CustomColour.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        )),
        Text(
          title.capitalize!,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? CustomColour.darkGrey : CustomColour.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Iconsax.direct_right,
                ),
                labelText: CusTomTexts.email),
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Iconsax.password_check,
              ),
              labelText: CusTomTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(CusTomTexts.rememberMe),
                ],
              ),
              TextButton(
                onPressed: ()=>Get.to(()=>const ForgetPassword()),
                child: const Text(CusTomTexts.forgetPassword),
              ),
            ],
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwSections,
          ),
          //sign-in button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: ()=>Get.to(()=>const NavigationBarMenue()), child: const Text(CusTomTexts.signIn))),
          const SizedBox(
            height: CustomSizes.spaceltwItems,
          ),
          //create Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: ()=>Get.to(()=> SignupScreen()),
              child: const Text(CusTomTexts.createAccount),
            ),
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwSections,
          )
        ],
      ),
    );
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(
              dark ? CustomImages.lightAppLogo : CustomImages.darkAppLogo),
        ),
        Text(
          CusTomTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: CustomSizes.sm,
        ),
        Text(
          CusTomTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: CustomSizes.spaceBtwSections,
        )
      ],
    );
  }
}
