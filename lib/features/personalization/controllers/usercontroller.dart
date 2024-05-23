import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/data/repo/authintication/user_repo.dart';
import 'package:getx_ecommerce/features/auth/models/usermodel/usermodel.dart';
import 'package:getx_ecommerce/utils/popups/loaders.dart';

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

@override
void onInit(){
  super.onInit();
  fetchUserRecord();
}

Future<void>fetchUserRecord()async{
  try{
   
    final user=await userRepo.fetchUserDetails();
    
    this.user(user);
    
  }catch(e){
    user(UserModel.fromJson(''));
  }
}

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final user = UserModel(
            id: userCredential.user!.uid,
            firstname: '',
            lastname: '',
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
