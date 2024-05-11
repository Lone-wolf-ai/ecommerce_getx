import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/common/imageicon/customcarticon/circleicon.dart';
import 'package:getx_ecommerce/common/styles/shape/container/circlecontainer.dart';
import 'package:getx_ecommerce/features/shop/screens/home/homescreen.dart';
import 'package:getx_ecommerce/common/widgets/card/productcardvertical.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: false,
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CircleIcon(dark: dark, icon: Iconsax.add, color: null, onpress: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              ProductCardGrid(
                  itemCount: 4,
                  itemBuilder: (_, index) => const ProductCartVertical())
            ],
          ),
        ),
      ),
    );
  }
}
