import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/circleimage/circularimage.dart';
import 'package:getx_ecommerce/common/styles/shape/container/roundedcontainer.dart';
import 'package:getx_ecommerce/common/text/brandtitleverifiedicon.dart';
import 'package:getx_ecommerce/utils/constants/enum.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.showBorder, this.ontap,
  });
  final bool showBorder;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(CustomSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            const Flexible(child: CircularImage()),
            const SizedBox(
              width: CustomSizes.spaceltwItems / 2,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TexCustomSizes.large,
                  ),
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),

        ///-- Icon
      ),
    );
  }
}