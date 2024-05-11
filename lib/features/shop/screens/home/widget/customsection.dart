
import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';

class CustomSectionWidget extends StatelessWidget {
  const CustomSectionWidget({
    super.key,
    required this.title,
    this.onPressed,
    this.buttontitle = 'View all',
    this.showActionButton = true,
    this.textcolor = CustomColour.textWhite,
  });
  final String title;
  final void Function()? onPressed;
  final String buttontitle;
  final bool showActionButton;
  final Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textcolor),
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttontitle))
      ],
    );
  }
}