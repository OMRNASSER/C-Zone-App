// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/core/view_model/control_view_model.dart';
import 'package:untitled/core/view_model/home_view_model.dart';
import 'package:untitled/view/Home_Screen.dart';
import 'package:untitled/view/Widget/CustomText.dart';
import 'package:untitled/view/Widget/custom_Button.dart';
class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(txt: "Notification", fontSize: 20 , ),
        centerTitle: true,
        iconTheme: IconThemeData(color:Colors.black38 , ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body : SafeArea(
        child: Column(

          children: [
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  CustomText(txt: "Hello, There!  ", fontSize: 26.0 , fontWeight: FontWeight.w900,),
                  CustomText(txt: "You have an Offer Check it quikly , ", fontSize: 16.0 ,fontWeight: FontWeight.w300,),



                ],
              ),
            ),
            const SizedBox(height: 10.0,),
            Expanded(child: Container(
              padding: EdgeInsets.only(left: 30.0 , right: 30.0),
              margin: EdgeInsets.only(left: 30.0 , right: 30.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: primaryColor ,
              ),
              child: SvgPicture.asset("assets/images/undraw_gifts_re_75wq.svg" , ),

            ), ),

            const SizedBox(height: 10.0,),





          ],
        ),
      ) ,
    );
  }
}
