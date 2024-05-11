import 'package:flutter/material.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

/// A widget for displaying an animated loading indicator with optional text and action button.
class TAnimationLoaderWidget extends StatelessWidget {
  /// Default constructor for the TAnimationLoaderWidget.
  ///
  /// Parameters:
  ///
  /// - text: The text to be displayed below the animation.
  /// - animation: The path to the Lottie animation file.
  /// - showAction (optional): Whether to show an action button below the text. Defaults to false.
  /// - actionText (optional): The text to be displayed on the action button.
  /// - onActionPressed (optional): Callback function to be executed when the action button is pressed.
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Empty space at the top (optional, remove if not needed)
          const SizedBox(),

          // Lottie animation with dynamic width based on screen size
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ),

          const SizedBox(height: CustomSizes.defaultSpace),

          // Text with proper styling
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: CustomSizes.defaultSpace),

          // Conditional rendering for action button
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: CustomColour.dark,
                    ),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme.bodyMedium!
                          .apply(color: CustomColour.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
