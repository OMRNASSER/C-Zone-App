import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/view/Home_Screen.dart';
import 'package:untitled/view/auth/login_screen.dart';

import '../../model/user_model.dart';
import '../services/firestore_user.dart';


class AuthViewModel extends GetxController {
//**** DisposableInterface ***///
// for more performance and clean memory
//Example : DisposableInterface that delete authentication after sign in from memory for more performance in app
//

// *** We Use Sign in GetXController because we need to separate data and ui
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;


  String email = '',
      password = '',
      name = '';
  Rxn<User>_fireBaseUser = Rxn<User>();

  String? get user => _fireBaseUser.value?.email;

  // final result = FacebookAuth.i.login(
  //   permissions: [ "public_profile", "email"],
  //
  // );

  @override
  //** using onInit In first call for controller --
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _fireBaseUser.bindStream(_auth.authStateChanges());
  }

  @override
  //** call if widget is already rendered on screen **//
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  //if the controller is deleted from memory
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void GoogleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleUser!
        .authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
    });
    //print(googleUser);
    Get.off(Home_Screen());
  }


  void signInEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((user) {
            saveUser(user);
      //  print(value);
      });
      Get.offAll(Home_Screen());
    } catch (e) {
      Get.snackbar(
        'Error login account',
        'The E-Mail that you enter Not Found',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,


      );
    }
  }

  void signUpEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password).then((user) async {
        saveUser(user);
      });


      Get.offAll(Home_Screen());
    } catch (e) {
      Get.snackbar(
        'Error login account',
        'The E-Mail that you enter Not Found',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,


      );
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(UserModel(
        userId: user.user?.uid, email: user.user?.email, name: name, pic: ""));
  }

}