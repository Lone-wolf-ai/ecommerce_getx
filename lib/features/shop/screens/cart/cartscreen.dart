import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/common/imageicon/customimage/customimage.dart';
import 'package:getx_ecommerce/common/imageicon/widget/circularicon.dart';
import 'package:getx_ecommerce/common/text/brandtitleverifiedicon.dart';
import 'package:getx_ecommerce/common/text/product_tiltle_text.dart';
import 'package:getx_ecommerce/features/shop/screens/checkout/checkoutscreen.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/productpricetext.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(CustomSizes.defaultSpace),
        child: CartItem(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => (Get.to(() => const CheckoutScreen())),
            child: const Text('Checkout \$250.0')),
      ),
    );
  }
}

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircurIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: CustomSizes.md,
          color: THelperFunctions.isDarkMode(context)
              ? CustomColour.white
              : CustomColour.black,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? CustomColour.darkerGrey
              : CustomColour.light,
        ),
        const SizedBox(
          width: CustomSizes.spaceltwItems,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: CustomSizes.spaceltwItems,
        ),
        const CircurIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: CustomSizes.md,
          color: CustomColour.white,
          backgroundColor: CustomColour.primary,
        )
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedImage(
          imageUrl: CustomImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(CustomSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? CustomColour.darkerGrey
              : CustomColour.light,
        ),
        const SizedBox(
          width: CustomSizes.spaceltwItems,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(
                child: ProductTitleText(
                    title:
                        'Black sports shoe dfa adfs fgsf gs fgsf gs fgs dfgdf'),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Color ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Green ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'UK 08 ',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
