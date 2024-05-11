import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getx_ecommerce/common/circleimage/circularimage.dart';
import 'package:getx_ecommerce/common/styles/shape/container/roundedcontainer.dart';
import 'package:getx_ecommerce/common/text/brandtitletext.dart';
import 'package:getx_ecommerce/common/text/brandtitleverifiedicon.dart';
import 'package:getx_ecommerce/common/text/product_tiltle_text.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/productpricetext.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/enum.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price and sale price
        Row(
          children: [
            //sale tag
            TRoundedContainer(
              radius: CustomSizes.sm,
              backgroundColor: CustomColour.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: CustomSizes.sm, vertical: CustomSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const SizedBox(
              width: CustomSizes.spaceltwItems,
            ),
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: CustomSizes.spaceltwItems,
            ),
            const ProductPriceText(price: '150'),
          ],
        ),
        //title
        const SizedBox(
          height: CustomSizes.spaceltwItems / 1.5,
        ),
        const ProductTitleText(title: 'Green Nike Sports Shirt'),
        //stock
        Row(
          children: [
            const ProductTitleText(title: 'Status '),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(
          height: CustomSizes.spaceltwItems / 1.5,
        ),
        //brand

        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: CircularImage(
                imagepath: CustomImages.shoeIcon,
                width: 32,
                height: 32,
              ),
            ),
            SizedBox(
              width: 100,
              child: TBrandTitleWithVerifiedIcon(
                title: 'Nike',
                brandTextSize: TexCustomSizes.medium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
