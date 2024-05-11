import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/styles/shape/container/circlecontainer.dart';
import 'package:getx_ecommerce/common/styles/shape/curved/curvededge.dart';
import 'package:getx_ecommerce/utils/constants/colors.dart';

class CustomCurvedWidget extends StatelessWidget {
  const CustomCurvedWidget({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: Container(
        color: CustomColour.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: Customcirclebox(
                color: CustomColour.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: Customcirclebox(
                color: CustomColour.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
