import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/common/imageicon/customcarticon/customcarticon.dart';
import 'package:getx_ecommerce/features/personalization/controllers/usercontroller.dart';
import 'package:getx_ecommerce/features/shop/screens/cart/cartscreen.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Controller = Get.put(UserController());
    return CustomAppBar(
      showBackArrow: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CusTomTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: CustomColour.grey),
          ),
          Obx(
            () => (Controller.user.value.username.isEmpty)
                ? const SizedBox(
                    width: 100,
                    child: LinearProgressIndicator(
                      color: Colors.white,
                    ))
                : Text(
                    Controller.user.value.username,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: CustomColour.white),
                  ),
          )
        ],
      ),
      actions: [
        CustomCartCounteIcon(
          color: CustomColour.white,
          onPressed: () => Get.to(() => const CartScreen()),
        )
      ],
    );
  }
}
