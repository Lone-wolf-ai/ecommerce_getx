import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/features/auth/screens/resetdone/resetdone.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
   const ForgetPassword({super.key});

  

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark; // Check for dark mode

    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace), // Consistent padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              CusTomTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: CustomSizes.spaceltwItems), // Consistent spacing
        
            Text(
              CusTomTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: CustomSizes.spaceBtwSections*2), // More space after subtitle
        
            // Email Text Field
            TextFormField(
              decoration: InputDecoration(
                labelText: CusTomTexts.email,
                prefixIcon: Icon(Iconsax.direct_right, color: isDarkMode ? Colors.white : Theme.of(context).primaryColor), // Adjust icon color based on theme
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwSections), // Consistent spacing
        
            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>Get.to(()=>const ResetPassword()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? Colors.white : Theme.of(context).primaryColor, // Adjust button color based on theme
                ),
                child: const Text(CusTomTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
