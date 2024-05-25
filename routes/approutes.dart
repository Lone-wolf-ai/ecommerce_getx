import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_ecommerce/features/auth/screens/forgetpassword/forgetpassword.dart';
import 'package:getx_ecommerce/features/auth/screens/login/login.dart';
import 'package:getx_ecommerce/features/auth/screens/onboarding/onboarding.dart';
import 'package:getx_ecommerce/features/auth/screens/signup/signup.dart';
import 'package:getx_ecommerce/features/auth/screens/verify_email/verify_email.dart';
import 'package:getx_ecommerce/features/shop/screens/address/adress.dart';
import 'package:getx_ecommerce/features/shop/screens/cart/cartscreen.dart';
import 'package:getx_ecommerce/features/shop/screens/checkout/checkoutscreen.dart';
import 'package:getx_ecommerce/features/shop/screens/favoorite/favoritescreen.dart';
import 'package:getx_ecommerce/features/shop/screens/home/homescreen.dart';
import 'package:getx_ecommerce/features/shop/screens/orderscreen/orderscreen.dart';
import 'package:getx_ecommerce/features/shop/screens/productreview/productreview.dart';
import 'package:getx_ecommerce/features/shop/screens/profileScreen/profile.dart';
import 'package:getx_ecommerce/features/shop/screens/setting/settings.dart';
import 'package:getx_ecommerce/features/shop/screens/shop/shop.dart';

import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const ShopScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReview()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfilScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const AddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onboarding, page: () => const OnBoardingScreen()), // Corrected case
    // Add more GetPage entries as needed
  ];
}
