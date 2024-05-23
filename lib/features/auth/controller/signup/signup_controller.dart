import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/data/repo/authintication/auth_repository.dart';
import 'package:getx_ecommerce/data/repo/authintication/user_repo.dart';
import 'package:getx_ecommerce/features/auth/models/usermodel/usermodel.dart';
import 'package:getx_ecommerce/features/auth/screens/verify_email/verify_email.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/helpers/network_manager.dart';
import 'package:getx_ecommerce/utils/popups/fullscreenloader.dart';
import 'package:getx_ecommerce/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  //variable
  final hidePassword = true.obs;
  final check = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  //signUp
  Future<void> signup() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing you information', CustomImages.docerimg);
      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //form validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //privacy policy chek
      if (!check.value) {
        Loaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account , you must have to read and accept term and policy of use');

        return;
      }
      //register user in the firebase authintication
      final UserCredential = await AuthintaicationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      //save authinticated data in firestore

      final newuser = UserModel(
          id: UserCredential.user!.uid,
          firstname: firstname.text.trim(),
          lastname: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePic: '');

      final userRepository = Get.put(UserRepo());
      await userRepository.saveUserRepo(newuser);
      TFullScreenLoader.stopLoading();      
      //show success message
      Loaders.successSnackBar( 
          title: 'Congratulations',
          message: "Your account has been created! verify email to continue");
         //TFullScreenLoader.stopLoading(); 
      //move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading(); 
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } 
  }
}
