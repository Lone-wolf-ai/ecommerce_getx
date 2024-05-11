import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/features/auth/models/usermodel/usermodel.dart';

import 'package:getx_ecommerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:getx_ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:getx_ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:getx_ecommerce/utils/exceptions/platform_exceptions.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();
  
  final FirebaseFirestore _db=FirebaseFirestore.instance;
  /*-------------------emain and password sign-in----------------------*/
  Future<void>saveUserRepo(UserModel user)async{
    try{
       await _db.collection("Users").doc(user.id).set(user.toMap());
    }on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw const TFormatException();
    }on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
}
