import 'package:flutter/material.dart';
import 'package:getx_ecommerce/common/styles/spacingstyle.dart';
import 'package:getx_ecommerce/features/auth/screens/login/widgets/login_widgets.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/constants/text_strings.dart';
import 'package:getx_ecommerce/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // logo, title and subtitle
              LoginHeader(dark: dark),
              //text fields email and password
              const LoginTextFields(),
              //divider with text
              CustomDivider(dark: dark,title: CusTomTexts.orSignInWith,),
              const SizedBox(
                height: CustomSizes.spaceltwItems,
              ),
              //login from third party
              const ThirdPartyLogin()
            ],
          ),
        ),
      ),
    );
  }
}

