import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/data/repo/authintication/user_repo.dart';
import 'package:getx_ecommerce/features/auth/models/usermodel/usermodel.dart';
import 'package:getx_ecommerce/utils/popups/loaders.dart';
import 'package:http/http.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepo=Get.put(UserRepo());
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final user = UserModel(
            id: userCredential.user!.uid,
            firstname: '',
            lastname:'',
            username: userCredential.user!.displayName ?? '',
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePic: userCredential.user!.photoURL ?? '');
            
            await userRepo.saveUserRepo(user);
      }

    } catch (e) {
      Loaders.warningSnackBar(
          title: 'Data not Saved',
          message: 'Something went wrong when saving your data');
    }
  }
}
