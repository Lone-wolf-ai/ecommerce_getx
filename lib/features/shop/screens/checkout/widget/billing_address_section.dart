import 'package:flutter/material.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/customsection.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSectionWidget(textcolor:dark?CustomColour.white:CustomColour.black ,
            title: 'Shipping Address', buttontitle: 'Change', onPressed: () {}),
        Text('Coding with T', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: CustomSizes.spaceltwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: CustomSizes.spaceltwItems),
            Text('+92-317-8059525',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceltwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: CustomSizes.spaceltwItems),
            Expanded(
                child: Text('South Liana, Maine 87695, USA',
                    style: Theme.of(context).textTheme.bodyMedium,
                    softWrap: true)),
          ],
        ),
      ],
    );
  }
}
