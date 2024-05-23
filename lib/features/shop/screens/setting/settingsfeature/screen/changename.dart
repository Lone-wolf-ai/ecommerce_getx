import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/features/shop/screens/setting/settingsfeature/controller/updatenamecontroller.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/constants/text_strings.dart';
import 'package:getx_ecommerce/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              'User real name for easy verification. This name will apear on several page',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: CusTomTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                    controller: controller.firstName,
                    validator: (value) =>
                        Validator.validateEmptyText('First Name', value),
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: CusTomTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                    validator: (value) =>
                        Validator.validateEmptyText('Last name', value),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: CustomSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text("Save")),
            )
          ],
        ),
      ),
    );
  }
}
