import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled/helper/local_storage_data.dart';
import 'package:untitled/view/Home_Screen.dart';
import 'package:untitled/view/auth/login_screen.dart';
import 'package:untitled/view/control_view.dart';

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
  final LocalStorageData localStorageData = Get.find();

  String email = '',
      password = '',
      name = '';
  Rxn<User>_fireBaseUser = Rxn<User>();

   String? get user => _fireBaseUser.value?.email;



  @override
  //** using onInit In first call for controller --
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _fireBaseUser.bindStream(_auth.authStateChanges());
    if(_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser!.uid);

    }
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
    // final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    // GoogleSignInAuthentication googleSignInAuthentication = await googleUser!
    //     .authentication;
    // final AuthCredential credential = GoogleAuthProvider.credential(
    //   idToken: googleSignInAuthentication.idToken,
    //   accessToken: googleSignInAuthentication.accessToken,
    // );
    // await _auth.signInWithCredential(credential);
    // //print(googleUser);
    // Get.offAll(Home_Screen());
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(ControlView());
    });
  }


  void signInEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
           getCurrentUserData(value.user!.uid);
      //  print(value);
      });
      Get.offAll(ControlView()); //may be this make error
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
      Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar(
        'Error login account',
        'The E-Mail that you enter Not Found',
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,


      );
    }
  }
  // void facebookSignInMethod() async {
  //   FacebookAuth.instance.webInitialize(
  //     appId: "283368220550988",
  //     cookie: true,
  //     xfbml: true,
  //     version: "v12.0",
  //   );
  // }
  void saveUser(UserCredential user) async {
    UserModel userModel =UserModel(
        userId: user.user?.uid,
        email: user.user?.email,
        name: name, pic: ""
    ) ;
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel) ;
  }



  void setUser (UserModel userModel) async {
    await localStorageData.setUSer(userModel) ;

  }
  void getCurrentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then(( dynamic value){
      setUser(UserModel.fromJson(value.data())) ;
    });

  }

}