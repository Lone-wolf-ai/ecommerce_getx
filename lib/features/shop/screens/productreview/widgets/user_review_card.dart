import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/common/styles/shape/container/roundedcontainer.dart';
import 'package:getx_ecommerce/features/shop/screens/productreview/productreview.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(CustomImages.userProfileImage1),
                ),
                const SizedBox(width: CustomSizes.spaceltwItems),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceltwItems),

        // Review
        Row(
          children: [
            // Placeholder for rating icon (remove if not needed)
            CustomRating(rating: 4),
            const SizedBox(width: CustomSizes.spaceltwItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: CustomSizes.spaceltwItems),

        ReadMoreText(
          // Assuming you have a ReadMoreText widget
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(
            color: Theme.of(context).primaryColor, // Customize color
          ),
          lessStyle: TextStyle(
            color: Theme.of(context).primaryColor, // Customize color
          ),
        ),
        const SizedBox(
          height: CustomSizes.spaceltwItems,
        ),
        TRoundedContainer(
          backgroundColor: dark ? CustomColour.darkGrey : CustomColour.grey,
          child: Padding(
            padding: const EdgeInsets.all(CustomSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "T's Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '02 Nov,2023',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                ReadMoreText(
                  // Assuming you have a ReadMoreText widget
                  'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: TextStyle(
                    color: Theme.of(context).primaryColor, // Customize color
                  ),
                  lessStyle: TextStyle(
                    color: Theme.of(context).primaryColor, // Customize color
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
