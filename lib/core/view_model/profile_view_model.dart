import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/helper/local_storage_data.dart';
import 'package:untitled/model/user_model.dart';

class ProfileViewModel extends GetxController {



  final LocalStorageData localStorageData = Get.find();


  UserModel? get userModel => _userModel ;
  UserModel? _userModel;

  ValueNotifier<bool> get loading => _loading ;
  late ValueNotifier<bool>  _loading = ValueNotifier(false )  ;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }



  void getCurrentUser() async {
    _loading.value = true ;
  await localStorageData.getUser.then((value) {
    _userModel= value ;
  });
  _loading.value = false ;
  update();
  }
  Future<void> signOut () async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut() ;
    localStorageData.deleteUser() ;

  }


}