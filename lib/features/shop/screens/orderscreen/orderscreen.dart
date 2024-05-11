import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/features/shop/screens/orderscreen/widget/orderlistitems.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'My Order',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(CustomSizes.defaultSpace),
        child: OrderListItems(),
      ),
    );
  }
}
