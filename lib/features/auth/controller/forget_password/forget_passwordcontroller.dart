import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/data/repo/authintication/auth_repository.dart';
import 'package:getx_ecommerce/features/auth/screens/resetdone/resetdone.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/helpers/network_manager.dart';
import 'package:getx_ecommerce/utils/popups/fullscreenloader.dart';
import 'package:getx_ecommerce/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormkey = GlobalKey<FormState>();

  //send reset password email
  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing your request', CustomImages.docerimg);
      final isconnected = await NetworkManager.instance.isConnected();
      //check internetconnectivity
      if (!isconnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //form validation
      if (!forgetPasswordFormkey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthintaicationRepository.instance.sendPasswordResetEmail(email.text.trim());
      //remove loader
      TFullScreenLoader.stopLoading();
      //show success screen
      Loaders.successSnackBar(title: 'email sent',message: 'email link sent to reset your password');
      //redirect 
      Get.to(()=> ResetPassword(email: email.text.trim(),));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }

  resendPasswordResetEmail(String email)async{
        try {
      TFullScreenLoader.openLoadingDialog(
          'Processing your request', CustomImages.docerimg);
      final isconnected = await NetworkManager.instance.isConnected();
      //check internetconnectivity
      if (!isconnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthintaicationRepository.instance.sendPasswordResetEmail(email);
      //remove loader
      TFullScreenLoader.stopLoading();
      //show success screen
      Loaders.successSnackBar(title: 'email sent',message: 'email link sent to reset your password');
      //redirect 
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
}
