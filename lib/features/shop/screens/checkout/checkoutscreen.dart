import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/common/styles/shape/container/roundedcontainer.dart';
import 'package:getx_ecommerce/features/auth/screens/success_screen/success_screen.dart';
import 'package:getx_ecommerce/features/shop/screens/cart/widget/cartitem.dart';
import 'package:getx_ecommerce/features/shop/screens/checkout/widget/biliing_amount_section.dart';
import 'package:getx_ecommerce/features/shop/screens/checkout/widget/billing_address_section.dart';
import 'package:getx_ecommerce/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:getx_ecommerce/navigation/navigationbar.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              const CartItems(
                isSelected: false,
              ),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              CouponCodeField(dark: dark),
              const SizedBox(
                height: CustomSizes.spaceBtwSections,
              ),
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(CustomSizes.md),
                backgroundColor: dark ? CustomColour.black : CustomColour.white,
                child: const Column(
                  children: [
                    //pricing
                    BillingAmountSection(),
                    SizedBox(
                      height: CustomSizes.spaceltwItems,
                    ),
                    //divider
                    Divider(),
                    SizedBox(
                      height: CustomSizes.spaceltwItems,
                    ),
                    //payment Method
                    Billingpaymentsection(),
                    SizedBox(
                      height: CustomSizes.spaceltwItems,
                    ),
                    //Address
                    BillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => (Get.to(() => SuccessScreen(
                  image: CustomImages.successfulPaymentIcon,
                  title: 'Payment Success',
                  subTitle: 'You item will be shipped soon!',
                  onPressed: () => Get.offAll(() => const NavigationBarMenue()),
                ))),
            child: const Text('Checkout \$250.0')),
      ),
    );
  }
}

class CouponCodeField extends StatelessWidget {
  const CouponCodeField({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? CustomColour.dark : CustomColour.white,
      padding: const EdgeInsets.only(
          top: CustomSizes.sm,
          bottom: CustomSizes.sm,
          right: CustomSizes.sm,
          left: CustomSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a Promo code? Enter here',
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.withOpacity(0.5),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                foregroundColor: dark
                    ? CustomColour.white.withOpacity(0.5)
                    : CustomColour.dark.withOpacity(0.5)),
            child: const Text('Apply'),
          )
        ],
      ),
    );
  }
}
