import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/data/repo/authintication/user_repo.dart';
import 'package:getx_ecommerce/features/personalization/controllers/usercontroller.dart';
import 'package:getx_ecommerce/features/shop/screens/profileScreen/profile.dart';
import 'package:getx_ecommerce/utils/constants/image_strings.dart';
import 'package:getx_ecommerce/utils/helpers/network_manager.dart';
import 'package:getx_ecommerce/utils/popups/fullscreenloader.dart';
import 'package:getx_ecommerce/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepo());
  final updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  /// Fetch user record (assuming `initializeNames` is implemented elsewhere)
  Future<void> initializeNames() async {
    // Implementation for fetching user data (likely involves calling userController)
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your information...',CustomImages.docerimg);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Handle no internet connectivity scenario (e.g., show error message)
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        // Validation failed (handle errors based on validation logic)
         TFullScreenLoader.stopLoading();
      return;
      }

      // Unreachable due to previous `return` statements

      // Update user's first & last name in the Firebase Firestore (assuming `updateSingleField` is implemented)
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'Last Name': lastName.text.trim()
      };
      await userRepository.updatesinglefield(name);

      // Update the Rx User value
      userController.user.value.firstname = firstName.text.trim();
      userController.user.value.lastname = lastName.text.trim();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      Loaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated.');

      // Move to previous screen
      Get.off(() => const ProfilScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
