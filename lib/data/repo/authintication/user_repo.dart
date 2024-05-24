import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/data/repo/authintication/auth_repository.dart';
import 'package:getx_ecommerce/features/auth/models/usermodel/usermodel.dart';

import 'package:getx_ecommerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:getx_ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:getx_ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:getx_ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:image_picker/image_picker.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  /*-------------------emain and password sign-in----------------------*/

  //to sace user repo
  Future<void> saveUserRepo(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toMap());
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

//for fetching details
  Future<UserModel?> fetchUserDetails() async {
    try {
      final documentsnapshot = await _db
          .collection("Users")
          .doc(AuthintaicationRepository.instance.auth!.uid)
          .get();
      if (kDebugMode) {
        print('usermodel data from user_repo');
        print(documentsnapshot.data().toString());
      }

      if (documentsnapshot.exists) {
        return UserModel.fromMap(documentsnapshot.data()!);
      } else {
        return null;
      }
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

//for udate details
  Future<void> updateUserDetails(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).update(user.toMap());
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

//for update single failed
  Future<void> updatesinglefield(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthintaicationRepository.instance.auth!.uid)
          .update(json);
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

//for remove user data
  Future<void> removeuserdata(String userid) async {
    try {
      await _db.collection('Users').doc(userid).delete();
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
  //upload image
  Future<String>uploadImage(String path,XFile img)async{
    try{
     final ref=FirebaseStorage.instance.ref(path).child(img.name);
     await ref.putFile(File(img.path));
     final url=await ref.getDownloadURL();
     return url;
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
