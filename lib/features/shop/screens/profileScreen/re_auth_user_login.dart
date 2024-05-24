import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/features/personalization/controllers/usercontroller.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/constants/text_strings.dart';
import 'package:getx_ecommerce/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthRepository extends StatelessWidget {
  const ReAuthRepository({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Re-Authinticaition User"),
      ),
      body: Form(
          child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                prefix: Icon(
                  Iconsax.direct_right,
                ),
                labelText: CusTomTexts.email),
            controller: controller.verifyEmail,
            validator: (value) => Validator.validateEmail(value),
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwInputFields,
          ),
          Obx(
            () => TextFormField(
              obscureText: controller.hidepassword.value,
              controller: controller.verifypassword,
              validator: (value) => Validator.validateEmail(value),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Iconsax.eye_slash),
                    onPressed: () => controller.hidepassword.value =
                        !controller.hidepassword.value,
                  ),
                  labelText: CusTomTexts.password,
                  prefix: const Icon(Iconsax.password_check)),
            ),
          ),
          SizedBox(
            height: CustomSizes.spaceBtwSections,
          ),
          SizedBox(
            child: ElevatedButton(
                onPressed: () =>
                    controller.reAuthenticateEmailAndPasswordUser(),
                child: Text("Re-Auth")),
          )
        ],
      )),
    );
  }
}
