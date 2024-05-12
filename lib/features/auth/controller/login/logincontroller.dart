import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_ecommerce/data/repo/authintication/auth_repository.dart';
import 'package:getx_ecommerce/features/personalization/controllers/usercontroller.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/helpers/network_manager.dart';
import 'package:getx_ecommerce/utils/popups/fullscreenloader.dart';
import 'package:getx_ecommerce/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final userController = Get.put(UserController());
  final rememberMe = true.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? ''; //its null
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? ''; //its null
    super.onInit();
  }

  //login with email and password
  emailAndPasswordlogin() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging you in', CustomImages.docerimg);
      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!loginFormkey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //it causing issue
      if (rememberMe.value) {
        (localStorage.read('REMEMBER_ME_EMAIL') == null)
            ? localStorage.writeIfNull('REMEMBER_ME_EMAIL', email.text.trim())
            : localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        (localStorage.read('REMEMBER_ME_PASSWORD') == null)
            ? localStorage.writeIfNull(
                'REMEMBER_ME_PASSWORD', email.text.trim())
            : localStorage.write('REMEMBER_ME_PASSWORD', email.text.trim());
      }
      //login user using email and password authentication
      final userCredential = await AuthintaicationRepository.instance
          .signInwithemailandPassword(email.text.trim(), password.text.trim());
      //Remove Loader
      TFullScreenLoader.stopLoading();
      //Redriect
      AuthintaicationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  //login with google sign in
  googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging you in.....', CustomImages.docerimg);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      final userCredential =
          await AuthintaicationRepository.instance.googleSignIn();

      
      userController.saveUserRecord(userCredential);
      //Remove Loader
      TFullScreenLoader.stopLoading();
      //Redriect
      AuthintaicationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
