import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_ecommerce/common/devicestoragestring/storagestring.dart';
import 'package:getx_ecommerce/features/auth/screens/login/login.dart';

class OnBoardingController extends GetxController{

static OnBoardingController get instance=> Get.find();

final pageController=PageController();
Rx<int>currentPageIndex=0.obs;

void updatePageIndicator(index)=>currentPageIndex.value=index;

void dotNavigationClick(index){
  currentPageIndex=index;
  pageController.jumpTo(index);
}

void nextPage(){
  if(currentPageIndex.value==2){
    final storage=GetStorage();
    if(kDebugMode){
      print("get storage next button");
      print(storage.read(StorageString.isfirst));
    }
    storage.write(StorageString.isfirst, false);
    Get.offAll(()=>const LoginScreen());
  }else{
    int page=++currentPageIndex.value;
    //print(page);
    pageController.jumpToPage(page);
  }
}

void skipPage(){
  currentPageIndex.value=2;
  pageController.jumpToPage(2);
}

}