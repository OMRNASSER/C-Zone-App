import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/core/view_model/auth_view_model.dart';
import 'package:untitled/view/Home_Screen.dart';
import 'package:untitled/view/auth/login_screen.dart';
import 'package:untitled/view/get_started.dart';

class ControlView extends GetWidget<AuthViewModel>{
  @override
  Widget build(BuildContext context) {
    return Obx((){
        return (Get.find<AuthViewModel>().user  != null )
            ? Home_Screen()
            :LoginScreen();

    });
  }




}