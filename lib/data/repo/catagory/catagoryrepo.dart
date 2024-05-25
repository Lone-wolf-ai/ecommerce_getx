import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/features/shop/models/categorymodel.dart';
import 'package:getx_ecommerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:getx_ecommerce/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance =>Get.find();
  //variable
  final _db=FirebaseFirestore.instance;
  //Get all categories
  Future<List<CategoryModel>>getAllCategories()async{
    try{
      //geting snapshot of data
      final snapshot=await _db.collection('Categories').get();
      //list 
      final list =snapshot.docs.map((e) => CategoryModel.fromMap(e.data())).toList();
      return list;
    }on FirebaseException catch (e){
      throw TFirebaseAuthException(e.code).message;
    }on PlatformException catch(e){
      throw TPlatformException(e.toString()).message;
    }catch (e){
      throw 'Something went wrong. please try again';
    }
  }
}