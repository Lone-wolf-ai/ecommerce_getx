import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/styles/shape/container/roundedcontainer.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/customsection.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class Billingpaymentsection extends StatelessWidget {
  const Billingpaymentsection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // Empty list
        CustomSectionWidget(
            title: 'Payment Method', buttontitle: 'Change',textcolor: dark?CustomColour.white:CustomColour.black, onPressed: () {}),
        const SizedBox(height: CustomSizes.spaceltwItems / 2),
        Row(
          children: [
            // Empty list
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? CustomColour.light : CustomColour.white,
              padding: const EdgeInsets.all(CustomSizes.sm),
              child: const Image(
                  image: AssetImage(CustomImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(width: CustomSizes.spaceltwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
