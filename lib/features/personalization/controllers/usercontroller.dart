import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/data/repo/authintication/auth_repository.dart';
import 'package:getx_ecommerce/data/repo/authintication/user_repo.dart';
import 'package:getx_ecommerce/features/auth/models/usermodel/usermodel.dart';
import 'package:getx_ecommerce/features/auth/screens/login/login.dart';
import 'package:getx_ecommerce/features/shop/screens/profileScreen/re_auth_user_login.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/constants/sizes.dart';
import 'package:getx_ecommerce/utils/helpers/network_manager.dart';
import 'package:getx_ecommerce/utils/popups/fullscreenloader.dart';
import 'package:getx_ecommerce/utils/popups/loaders.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepo = Get.put(UserRepo());
  Rx<UserModel> user = UserModel(
          id: '',
          firstname: '',
          lastname: '',
          username: '',
          email: '',
          phoneNumber: '',
          profilePic: '')
      .obs;
  final hidepassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifypassword = TextEditingController();
  final imguploading = false.obs;

  GlobalKey<FormState> reAuthFormkey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepo.fetchUserDetails();

      this.user(user);
    } catch (e) {
      user(UserModel.fromJson(''));
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final user = UserModel(
              id: userCredential.user!.uid,
              firstname: '',
              lastname: '',
              username: userCredential.user!.displayName ?? '',
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePic: userCredential.user!.photoURL ?? '');
          //save user data
          await userRepo.saveUserRepo(user);
        }
      }
    } catch (e) {
      Loaders.warningSnackBar(
          title: 'Data not Saved',
          message: 'Something went wrong when saving your data');
    }
  }

//warning pop up
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(CustomSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(), // Removed async keyword
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: CustomSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }

//delete user account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', CustomImages.docerimg);

      // First re-authenticate user
      final auth = AuthintaicationRepository.instance;
      final provider = auth.auth!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.googleSignIn(); // Reauthenticate with Google
          await auth.deleteAccount(); // Delete account
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen()); // Navigate to Login screen
        } else if (provider == 'password') {
          // Implement password authentication handling here (placeholder)
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthRepository());
        }
      } else {
        // Handle case where no provider is found (placeholder)
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //reauthemailandpassword
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', CustomImages.docerimg);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormkey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthintaicationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifypassword.text.trim());
      await AuthintaicationRepository.instance.deleteAccount();

      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      // Handle error (already present in the original code)
      TFullScreenLoader.stopLoading();
      Loaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  //upload profile image
  uploadUserProfilePicture() async {
    try {
      final img = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxHeight: 512,
          maxWidth: 512,
          imageQuality: 70);
      if (img != null) {
        imguploading.value=true;
        final imgurl = await userRepo.uploadImage('Users/image/profile', img);
        //update user img record
        Map<String, dynamic> json = {'profilePic': imgurl};
        await userRepo.updatesinglefield(json);

        user.value.profilePic = imgurl;
        user.refresh();
        Loaders.successSnackBar(
            title: 'Congratulations',
            message: 'your Profic Image has been updated');
      }
    } catch (e) {
      Loaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }finally{
      imguploading.value=false;
    }
  }
}
