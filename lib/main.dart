import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/view/SplashScreen.dart';
import 'package:untitled/view/Widget/CustomText.dart';
import 'package:untitled/view/auth/login_screen.dart';
import 'package:untitled/view/control_view.dart';
import 'package:untitled/view/get_started.dart';
import 'package:flutter/cupertino.dart';

import 'helper/Binding.dart';
//async for initialize in firebase
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp() ;
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
     home:Scaffold(
        backgroundColor: primaryColor,
      // body:GestureDetector(
      //
      //   onTap: (){
      //     Get.offAll(ControlView());
      //   },
      //   child: Column(
      //     children: [
      //
      //       CustomText(txt: "GET STARTED" ,fontSize: 30, alignment: Alignment.bottomCenter , color: primaryColor),
      //
      //     ],
      //   ),
     body:  SplashScreen(),
       
      ),
     );

  }














}