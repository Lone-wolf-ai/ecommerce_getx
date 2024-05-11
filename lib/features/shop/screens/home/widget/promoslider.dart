import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/imageicon/customimage/customimage.dart';
import 'package:getx_ecommerce/common/styles/shape/container/circlecontainer.dart';
import 'package:getx_ecommerce/features/shop/controllers/homecontroller.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key, required this.banners});
  final List<String>banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                controller.updatePageIndicator(index),
          ),
          items: banners.map((e) => RoundedImage(imageUrl: e)).toList(),
        ),
        const SizedBox(
          height: CustomSizes.spaceltwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  Customcirclebox(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    color: controller.carousalCurrentIndex.value == i
                        ? CustomColour.primary
                        : CustomColour.grey,
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
