import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/styles/shape/container/circlecontainer.dart';
import 'package:getx_ecommerce/common/widgets/customcurvedwidget.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomCurvedWidget(
      child: Container(
        color: CustomColour.primary,
        child: Stack(
          children: [
            // Background custom shapes
            Positioned(
              top: -150.0, // Use double values for layout
              right: -250.0,
              child: Customcirclebox(
              color: CustomColour.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100.0, // Use double values for layout
              right: -300.0,
              child: Customcirclebox(
                color: CustomColour.textWhite.withOpacity(0.1),
              ),
            ),
             child
           
         
          ],
        ),
      ),
    );
  }
}
