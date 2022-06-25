import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/view/SplashScreen.dart';
import 'package:untitled/view/control_view.dart';

class SplashScreenState  extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 1),(){
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_)=>ControlView()));
    });

}
  @override
  Widget build(BuildContext context) {
    var image = Image.asset( "assets/images/unknown.png" , width:350 ,height: 100, );
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          children: [
            //image here
            Image.asset( "assets/images/CZone.png" ,height:584,scale:3.00,),
            SizedBox(height: 20),
            Center(
              child: CircularProgressIndicator(
                color: Colors.white ,
              ),
            ),
          ],
        ),

      ),
    );

  }




}