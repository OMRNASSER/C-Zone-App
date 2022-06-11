import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/core/view_model/home_view_model.dart';
import 'package:untitled/view/Widget/CustomText.dart';
import 'package:untitled/view/auth/login_screen.dart';

import '../core/view_model/control_view_model.dart';

class Home_Screen extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final List<String> names = <String>["Men","Girls","S","S","S"];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder:(controller) => controller.loading.value ? Center(child: CircularProgressIndicator(color: primaryColor,)) :  Scaffold(
        body:ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
              ),
              padding: EdgeInsets.only(top:30 ,left: 20 , right:20),
              child: Column(
                children: [

                     _searchTextFormField(),
                      SizedBox(height: 40,),
                      CustomText(txt:"Categories", fontWeight: FontWeight.bold,),
                      SizedBox(height: 20,),
                      _listViewCategory(names),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(txt : "Best Selling" , fontSize: 18, fontWeight: FontWeight.bold,),

                          CustomText(txt : "See all" , fontSize: 15),

                        ],

                      ),
                      SizedBox(height: 10,),
                      _listViewProducts(),

              //log out
              //         Center(child:
              //           FlatButton(
              //             onPressed: () {
              //             _auth.signOut();
              //             Get.offAll(LoginScreen());
              //           },
              //             child:Text("Log Out"),
              //       ),
              //       ),

                  ],
                ),
              ),
          ],

        ),
      ),
    );

  }
  Widget _searchTextFormField(){
   return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),

      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none ,
          prefixIcon: Icon(Icons.search , color: Colors.black , ),
          iconColor: Colors.black ,
        ),
      ),
    );
  }
  Widget _listViewCategory( List names){
    return GetBuilder<HomeViewModel>(
      builder: (controller) =>  Container(
        height: 100,
        child: ListView.separated(

          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index){
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(controller.categoryModel[index].image.toString()),
                  ),


                ),
                SizedBox(width: 20,height: 5.0,),
                CustomText(txt: controller.categoryModel[index].name.toString(),fontSize: 12,),
              ],

            );

          }, separatorBuilder: ( context,  index) => SizedBox(width: 20,),



        ),

      ),
    ) ;
  }

 Widget _listViewProducts() {
    return Container(
      height: 250,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context , index){
          return Container(
            width: MediaQuery.of(context).size.width * .4,
            height: MediaQuery.of(context).size.width * .4 ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start    ,
              children: [
                Image.asset("assets/images/mode.jpg", width:210 , height: 210,),
                SizedBox(width: 20,),
                CustomText(txt: "New Street Wear for Men" , alignment: Alignment.bottomLeft, fontSize: 10,),
                CustomText(txt: "Nike" , color:Colors.grey, fontSize: 10,alignment: Alignment.bottomLeft,  ),
                CustomText(txt: "EGP 150" , alignment: Alignment.bottomLeft,color: primaryColor,fontSize: 10, ),

              ],

            ),
          );

        }, separatorBuilder: ( context,  index) => SizedBox(width: 20,),



      ),

    );
 }


}