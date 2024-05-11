import 'package:flutter/material.dart';
import 'package:getx_ecommerce/features/shop/screens/cart/cartscreen.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/productpricetext.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.isSelected = true});
  final bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(
        height: CustomSizes.spaceBtwSections,
      ),
      itemBuilder: (_, index) => Column(
        children: [
          const CartItem(),
          if (isSelected!)
            const SizedBox(
              height: CustomSizes.spaceltwItems,
            ),
          if (isSelected!)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    ProductQuantityWithAddRemoveButton(),
                  ],
                ),
                ProductPriceText(price: '256'),
              ],
            )
        ],
      ),
    );
  }
}
