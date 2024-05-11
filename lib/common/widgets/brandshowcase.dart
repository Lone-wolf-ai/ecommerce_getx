import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/styles/shape/container/roundedcontainer.dart';
import 'package:getx_ecommerce/common/widgets/brandcard.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: CustomColour.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: CustomSizes.spaceltwItems),
      padding: const EdgeInsets.all(CustomSizes.md),
      child: Column(
        children: [
          const BrandCard(showBorder: false),
          Row(
            children: images
                .map((image) => brandTopProductImage(context, image))
                .toList(),
          )
        ],
      ),
    );
  }
    Widget brandTopProductImage(BuildContext context, String image) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? CustomColour.darkGrey
            : CustomColour.light,
        margin: const EdgeInsets.only(right: CustomSizes.sm),
        padding: const EdgeInsets.all(CustomSizes.md),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
