import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  
  const ProductPriceText(
      {super.key,
      this.currencySign = '\$',
      required this.price,
      this.maxlines = 1,
      this.islarge = false,
      this.lineThrough = false});

  final String currencySign, price;
  final int maxlines;
  final bool islarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(currencySign + price,
        maxLines: maxlines,
        overflow: TextOverflow.ellipsis,
        style: islarge
            ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null));
  }
}
