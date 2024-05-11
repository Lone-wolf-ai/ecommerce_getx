import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/gridlayout/gridlayout.dart';
import 'package:getx_ecommerce/common/widgets/card/productcardvertical.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Removed unnecessary element (1)
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: CustomSizes.spaceBtwSections),
    
        /// Products
        GridLayout(
            itemCount: 4,
            itemBuilder: (__, index) => const ProductCartVertical()),
      ],
    );
  }
}
