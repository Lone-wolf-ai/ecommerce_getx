import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/features/auth/controller/signup/signup_controller.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/constants/text_strings.dart';
import 'package:getx_ecommerce/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
     autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  validator: (value) =>
                      Validator.validateEmptyText('First Name', value),
                  decoration: const InputDecoration(
                    labelText: CusTomTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: CustomSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      Validator.validateEmptyText('Last Name', value),
                  decoration: const InputDecoration(
                    labelText: CusTomTexts
                        .lastName, // Changed from firstName to lastName
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                Validator.validateEmptyText('Username', value),
            decoration: const InputDecoration(
                labelText: CusTomTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.email,
            validator: (value) => Validator.validateEmail(value),
            decoration: const InputDecoration(
                labelText: CusTomTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => Validator.validatePhoneNumber(value),
            decoration: const InputDecoration(
                labelText: CusTomTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          Obx(
            ()=> TextFormField(
              controller: controller.password,
              validator: (value) => Validator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                  labelText: CusTomTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: controller.hidePassword.value
                          ? const Icon(Iconsax.eye)
                          : const Icon(Iconsax.eye_slash))),
            ),
          ),
        ],
      ),
    );
  }
}

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Row(
      children: [
        Obx(
          ()=> SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: controller.check.value,
              onChanged: (v) =>controller.check.value=!controller.check.value,
            ),
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "${CusTomTexts.iAgreeTo} ",
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: "${CusTomTexts.privacyPolicy} ",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? CustomColour.white : CustomColour.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? CustomColour.white : CustomColour.primary,
                    ),
              ),
              TextSpan(
                  text: "${CusTomTexts.and} ",
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: "${CusTomTexts.termsOfUse} .",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? CustomColour.white : CustomColour.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? CustomColour.white : CustomColour.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
