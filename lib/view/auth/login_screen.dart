import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/core/view_model/auth_view_model.dart';
import 'package:untitled/view/Widget/CustomText.dart';
import 'package:untitled/view/Widget/custom_Button.dart';
import 'package:untitled/view/Widget/custom_social_button.dart';
import 'package:untitled/view/Widget/custom_text_form_field.dart';
import 'package:untitled/view/auth/register_view.dart';


class LoginScreen extends GetWidget<AuthViewModel > {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final double high = 18;
  bool _isLoggedIn = false;
  Map _userObj = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Form(
          key: _formkey ,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //*** Custom Text for any text in Project ***//
                  CustomText(txt: "Welcome,", color: Colors.black, fontSize: 30),
                  GestureDetector(
                    onTap: (){
                      Get.to(RegisterScreen());
                    },
                      child: CustomText(txt: "Sign Up", fontSize: 18, color: primaryColor)),
                ],
              ),
              SizedBox(height: high),
              CustomText(
                  txt: "Sign in to Continue",
                  color: Color.fromRGBO(146, 146, 146, 100)),
              SizedBox(
                height: high,
              ),
              //*** Email ***// by custom text form for any form in program
              CustomTextForm(
                txt: "Email",
                hint: "iammustafa@gmail.com",
                validator: (value) {
                  if(value == null ){
                    print("Error");
                  }
                },
                onSaved: (value) {
                  controller.email = value! ;
                },
              ),
              SizedBox(
                height: high,
              ),
              //*** Password ***// Custom form for password
              CustomTextForm(
                txt: "Password",
                hint: "***************",
                validator: (value) {
                  if (value == null ){
                    print("ERROR");
                  }
                },
                onSaved: (value) {
                  controller.password = value!  ;
                },
              ),
              SizedBox(height: high),
              CustomText(
                txt: "Forgot Password?",
                color: Colors.grey.shade700,
                fontSize: 20,
                alignment: Alignment.topRight,
              ),
              SizedBox(height: 10),
              CustomButton(
                onPressed: () {
                  //** flutter pure without Get-X **//
                  // Navigator.push(context ,MaterialPageRoute(
                  //     builder:(context)=> SecondScreen(),
                  // ),);
                  //** flutter with Get-x easy to go in within screens **//
                  // Get.to(SecondScreen());
                  _formkey.currentState?.save();
                  if(_formkey.currentState?.validate() != null ) {
                    controller.signInEmailAndPassword();
                  }



                },
                txt: "SIGN IN",
                color: primaryColor,
              ),
              SizedBox(height: 10),
              CustomText(
                txt: "-OR-",
                color: Colors.black,
                fontSize: 20,
                alignment: Alignment.center,
              ),
              SizedBox(height: 20),
              SocialButton(imageName: "assets/images/Icon_Facebook.png",
                  name: "Sign In with Facebook",
                  onPressed: () {


                  }
              ),
              SizedBox(height: 20),
              SocialButton(
                  imageName: "assets/images/icons8_Google_2.png",
                  name: "Sign In with Google",
                  onPressed:(){
                    controller.GoogleSignInMethod() ;


                  }
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
