import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/styles/shape/container/roundedcontainer.dart';
import 'package:getx_ecommerce/common/text/product_tiltle_text.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/customsection.dart';
import 'package:getx_ecommerce/features/shop/screens/home/widget/productpricetext.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class ProductAttribute extends StatelessWidget {
  const ProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          backgroundColor: dark ? CustomColour.darkGrey : CustomColour.grey,
          padding: const EdgeInsets.all(CustomSizes.md),
          child: Column(
            children: [
              //title,price and stack status
              Row(
                children: [
                  CustomSectionWidget(
                    title: 'Variation',
                    showActionButton: false,
                    textcolor: THelperFunctions.isDarkMode(context)
                        ? CustomColour.white
                        : CustomColour.black,
                  ),
                  const SizedBox(
                    width: CustomSizes.spaceltwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          //actual price
                          const ProductTitleText(
                            title: 'Price : ',
                            isSmallSize: true,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: CustomSizes.spaceltwItems,
                          ),
                          const ProductPriceText(price: '20')
                        ],
                      ),
                      //stock
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Stock : ',
                            isSmallSize: true,
                          ),
                          Text(
                            ' In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              //variation descripton
              const ProductTitleText(
                  isSmallSize: true,
                  maxLines: 4,
                  title:
                      'This is the Description of the product and it can go up to max 4 lines'),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSectionWidget(
              title: 'Colors',
              textcolor: THelperFunctions.isDarkMode(context)
                  ? CustomColour.white
                  : CustomColour.black,
            ),
            const SizedBox(
              height: CustomSizes.spaceltwItems / 2,
            ),
            const Column(
              children: [
                Wrap(spacing: 8, children: [
                  CustomChoiceChip(
                    text: 'Green',
                    selected: true,
                  ),
                  CustomChoiceChip(
                    text: 'Blue',
                    selected: false,
                  ),
                  CustomChoiceChip(
                    text: 'Yellow',
                    selected: false,
                  ),
                  CustomChoiceChip(
                    text: 'Red',
                    selected: false,
                  ),
                ]),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSectionWidget(
                  title: "Size",
                  textcolor: THelperFunctions.isDarkMode(context)
                      ? CustomColour.white
                      : CustomColour.black,
                ),
                Wrap(spacing: 8, children: [
                  CustomChoiceChip(
                    onselected: (v) {},
                    text: 'EU 34',
                    selected: true,
                  ),
                  CustomChoiceChip(
                    onselected: (v) {},
                    text: 'EU 36',
                    selected: false,
                  ),
                  CustomChoiceChip(
                    onselected: (value) {},
                    text: 'EU 38',
                    selected: false,
                  ),
                ]),
              ],
            )
          ],
        )
      ],
    );
  }
}

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onselected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onselected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: THelperFunctions.getColor(text) != null
            ? const SizedBox()
            : Text(
                text,
                style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: THelperFunctions.isDarkMode(context)
                        ? CustomColour.white
                        : CustomColour.black),
              ),
        selected: selected,
        onSelected: onselected,
        selectedColor: THelperFunctions.getColor(text),
        shape: THelperFunctions.getColor(text) != null
            ? const CircleBorder()
            : null,
        labelPadding: THelperFunctions.getColor(text) != null
            ? const EdgeInsets.all(0)
            : null,
        padding: THelperFunctions.getColor(text) != null
            ? const EdgeInsets.all(0)
            : null,
        backgroundColor: THelperFunctions.getColor(text),
        labelStyle: TextStyle(color: selected ? CustomColour.white : null),
        avatar: THelperFunctions.getColor(text) != null
            ? TRoundedContainer(
                width: 50,
                height: 50,
                backgroundColor: THelperFunctions.getColor(text)!,
              )
            : null,
      ),
    );
  }
}
