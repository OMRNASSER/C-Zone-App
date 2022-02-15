import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/view/Widget/CustomText.dart';
import 'package:untitled/view/Widget/custom_Button.dart';
import 'package:untitled/view/Widget/custom_social_button.dart';
import 'package:untitled/view/Widget/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  final double high = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //*** Custom Text for any text in Project ***//
                CustomText(txt: "Welcome,", color: Colors.black, fontSize: 30),
                CustomText(txt: "Sign Up", fontSize: 18, color: primaryColor),
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
              validator: (value) {},
              onSaved: (vlaue) {},
            ),
            SizedBox(
              height: high,
            ),
            //*** Password ***// Custom form for password
            CustomTextForm(
              txt: "Password",
              hint: "***************",
              validator: (value) {},
              onSaved: (value) {},
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
              onPressed: () {},
              txt: "SIGN IN",
              color: primaryColor,
            ),
            SizedBox(height: 10),
            CustomText(
              txt: "-OR-",
              color: Colors.black,
              fontSize: 25,
              alignment: Alignment.center,
            ),
            SizedBox(height: 20),
            SocialButton(imageName: "assets/images/Icon_Facebook.png",name:"Sign In with Facebook"),
            SizedBox(height: 20),
            SocialButton(imageName:"assets/images/icons8_Google_2.png" , name: "Sign In with Google",),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
