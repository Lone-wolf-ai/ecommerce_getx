import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/imageicon/customimage/customimage.dart';
import 'package:getx_ecommerce/common/styles/shape/container/circlecontainer.dart';
import 'package:getx_ecommerce/features/shop/controllers/bannercontrol.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                controller.updatePageIndicator(index),
          ),
          items: controller.banners
              .map((e) => RoundedImage(
                    imageUrl: e.imageUrl,
                    isNetworkImage: true,
                    onPressed: () => Get.toNamed(e.targetScreen),
                  ))
              .toList(),
        ),
        const SizedBox(
          height: CustomSizes.spaceltwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < controller.banners.length; i++)
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
