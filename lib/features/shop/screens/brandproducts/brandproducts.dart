import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/common/widgets/brandcard.dart';
import 'package:getx_ecommerce/common/widgets/soratable/sortable.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: Text('Nike')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            children: [
              // Brand detail (assuming TBrandCard shows details)
              BrandCard(showBorder: true),
              SizedBox(height: CustomSizes.spaceBtwSections),

              // Sortable products list (assuming TSortableProducts displays products)
              SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
