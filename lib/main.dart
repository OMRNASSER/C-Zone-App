import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/auth/login_screen.dart';
import 'package:untitled/view/control_view.dart';

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

       body:ControlView(),
     ),
    );

  }













}