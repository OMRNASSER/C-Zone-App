

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled/view/Widget/CustomText.dart';

import '../core/view_model/profile_view_model.dart';
import 'auth/login_screen.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init : Get.put(ProfileViewModel()),
      builder:(controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
      :Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //name and avatar
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width:100 ,
                          height: 100,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: Colors.green[200],
                            borderRadius: BorderRadius.all(Radius.circular(300.0)),
                            image: DecorationImage(
                                image: controller.userModel== null
                                ? AssetImage("assets/images/messi.jpg") as ImageProvider
                                  : controller.userModel!.pic.toString() == "default"
                              ? AssetImage("assets/images/messi.jpg") as ImageProvider
                              : NetworkImage(controller.userModel!.pic.toString()),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(txt: controller.userModel!.name.toString(),  fontSize: 24.0,  ),
                            SizedBox(height: 5.0,),
                            CustomText(txt: controller.userModel!.email.toString(),fontSize: 24, color: Colors.grey,),

                          ],
                        ),
                      ),

                    ],



                  ),
                ) ,
                SizedBox(height: 70,),
                //Edit Profile
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset("assets/images/Icon_Edit-Profile.png", ),
                            SizedBox(width: 10.0, ) ,
                            CustomText(txt: "Edit Profile", fontSize: 18, ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, ),
                    ],
                  ),
                ),
                //Shipping Address
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset("assets/images/Icon_Location.png", ),
                            SizedBox(width: 10.0, ) ,
                            CustomText(txt: "Shipping Address", fontSize: 18, ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, ),
                    ],
                  ),
                ),
                //Order History
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset("assets/images/Icon_History.png", ),
                            SizedBox(width: 10.0, ) ,
                            CustomText(txt: "Order History", fontSize: 18,  color: Colors.black,),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, ),
                    ],
                  ),
                ),
                //Cards
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset("assets/images/Icon_Payment.png", ),
                            SizedBox(width: 10.0, ) ,
                            CustomText(txt: "Cards", fontSize: 18, ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, ),
                    ],
                  ),
                ),
                //Notifications
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset("assets/images/Icon_Alert.png", ),
                            SizedBox(width: 10.0, ) ,
                            CustomText(txt: "Notifications", fontSize: 18, ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, ),
                    ],
                  ),
                ),
                //Log Out

                GestureDetector(
                  onTap: (){
                    controller.signOut() ;
                    Get.offAll(LoginScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Image.asset("assets/images/Icon_Exit.png", ),
                              SizedBox(width: 10.0, ) ,
                              CustomText(txt: "Log Out", fontSize: 18, ),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, ),
                      ],
                    ),
                  ),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
