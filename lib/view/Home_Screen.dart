import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/view/auth/login_screen.dart';

class Home_Screen extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Screen",
        ),
        leading: Row(
          children: [
            Icon(Icons.search),
          ],
        ),


        backgroundColor: primaryColor,
        actions: [
          Icon(Icons.add_shopping_cart),
        ],
      ),

      body: Center(child:FlatButton(
        onPressed: (){
          _auth.signOut();
          Get.offAll(LoginScreen());
        },
        child: Text("Log Out"),
      ),
      ),

    );
  }


}