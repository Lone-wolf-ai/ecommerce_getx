import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_ecommerce/common/devicestoragestring/storagestring.dart';
import 'package:getx_ecommerce/features/auth/screens/login/login.dart';
import 'package:getx_ecommerce/features/auth/screens/onboarding/onboarding.dart';
import 'package:getx_ecommerce/features/auth/screens/verify_email/verify_email.dart';
import 'package:getx_ecommerce/navigation/navigationbar.dart';
import 'package:getx_ecommerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:getx_ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:getx_ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:getx_ecommerce/utils/exceptions/platform_exceptions.dart';

class AuthintaicationRepository extends GetxController {
  static AuthintaicationRepository get instance => Get.find();
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  screenRedirect() async {
    final user=_auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationBarMenue());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      //local storage
      deviceStorage.writeIfNull(StorageString.isfirst, true);
      deviceStorage.read(StorageString.isfirst) != true
          ? Get.off(() => const LoginScreen())
          : Get.off(() => const OnBoardingScreen());
    }
  }

  /*-------------------emain and password sign-in----------------------*/
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //send email verification
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void> logut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=>const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
