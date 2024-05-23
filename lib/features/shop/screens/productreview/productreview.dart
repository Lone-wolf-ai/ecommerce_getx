import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getx_ecommerce/common/appbar/customappbar.dart';
import 'package:getx_ecommerce/features/shop/screens/productreview/widgets/user_review_card.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/device/device_utility.dart';
import 'package:iconsax/iconsax.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text('Reviews & Ratings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use."),
              SizedBox(height: CustomSizes.spaceltwItems),

              /// Overall Product Ratings
              OverAllProductRating(),
              //stars
              CustomRating(rating: 4,),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key, required this.rating,
  });
 final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating:rating,
        unratedColor: CustomColour.grey,
        itemSize: 20,
        itemBuilder: (_, __) => const Icon(Iconsax.star1,color: CustomColour.primary,));
  }
}

class OverAllProductRating extends StatelessWidget {
  const OverAllProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgressindicator(
                value: 1,
                text: '5',
              ),
              RatingProgressindicator(
                value: 0.8,
                text: '4',
              ),
              RatingProgressindicator(
                value: 0.6,
                text: '3',
              ),
              RatingProgressindicator(
                value: 0.4,
                text: '2',
              ),
              RatingProgressindicator(
                value: 0.2,
                text: '1',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RatingProgressindicator extends StatelessWidget {
  const RatingProgressindicator({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: CustomDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value, // Assuming 50% rating for demonstration
              minHeight: 11,
              backgroundColor: CustomColour.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(CustomColour.primary),
            ),
          ),
        ),
      ],
    );
  }
}
