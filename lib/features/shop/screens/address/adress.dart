import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/features/shop/screens/address/addnewscreen.dart';
import 'package:getx_ecommerce/features/shop/screens/address/widgets/single_adress.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Iconsax.add,
          color: CustomColour.white,
        ),
        onPressed: () => Get.to(
          () => const AddNewAddressScreen(),
        ),
      ),
      appBar: CustomAppBar(
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),

      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(selectedAdress: true),
              SingleAddress(selectedAdress: false),
            ],
          ),
        ),
      ),
    );
  }
}
