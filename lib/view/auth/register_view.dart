import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/view_model/auth_view_model.dart';
import 'package:untitled/view/Widget/CustomText.dart';
import 'package:untitled/view/Widget/custom_text_form_field.dart';
import 'package:untitled/view/auth/login_screen.dart';

import '../../Constant.dart';
import '../Widget/custom_Button.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final double high = 18;
  final bool _isLoggedIn = false;
  final Map _userObj = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.offAll(LoginScreen());
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    //*** Custom Text for any text in Project ***//
                    CustomText(txt: "Sign Up", color: Colors.black, fontSize: 30),
                  ],
                ),
                SizedBox(height: high),
                SizedBox(
                  height: high,
                ),
                CustomTextForm(
                  txt: "Name",
                  color: Colors.grey,
                  hint: "Mustafa Kenawy",
                  onSaved: (value) {
                    controller.name = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                    return null;
                  },
                  obsecure: false,
                ),
                SizedBox(
                  height: high,
                ),
                //*** Email ***// by custom text form for any form in program
                CustomTextForm(
                  txt: "Email",
                  hint: "example@abc.com",
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.email = value!;
                  },
                  obsecure: false,
                ),
                SizedBox(
                  height: high,
                ),

                //*** Password ***// Custom form for password
                CustomTextForm(
                  txt: "Password",
                  hint: "***************",
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    controller.password = value!;
                  },
                  obsecure: true,
                ),
                SizedBox(height: high),

                const SizedBox(height: 10),
                CustomButton(
                  onPressed: () {
                    //** flutter pure without Get-X **//
                    // Navigator.push(context ,MaterialPageRoute(
                    //     builder:(context)=> SecondScreen(),
                    // ),);
                    //** flutter with Get-x easy to go in within screens **//
                    // Get.to(SecondScreen());
                    _formkey.currentState?.save();
                    if (_formkey.currentState?.validate() != null) {
                      controller.signUpEmailAndPassword();
                    }
                  },
                  txt: "SIGN UP",
                  color: primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
