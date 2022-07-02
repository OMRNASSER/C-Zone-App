import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/core/view_model/home_view_model.dart';
import 'package:untitled/view/Widget/CustomText.dart';
import 'package:untitled/view/auth/login_screen.dart';
import 'package:untitled/view/see_all_view.dart';

import '../core/view_model/control_view_model.dart';
import 'details_view.dart';

class Home_Screen extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final List<String> names = <String>["Men","Girls","S","S","S"];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
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

                          FlatButton(child: CustomText(txt : "See all" , fontSize: 15) , onPressed: (){
                            Get.to(SeeAllView());
                          }),

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
    return GetBuilder<HomeViewModel>(
      builder: (controller) =>  Container(
        height: 300,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index){
            return GestureDetector(
              onTap:(){
                Get.to(
                    DetailsView(model: controller.productModel[index]),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4 ,
                height: MediaQuery.of(context).size.height * .5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start    ,
                  children: [
                    Image.network(controller.productModel[index].image.toString(),width: double.infinity, height:MediaQuery.of(context).size.height * .3,fit: BoxFit.cover,),
                    SizedBox(width: 10,),
                    Expanded(child: CustomText(txt: controller.productModel[index].name.toString() , alignment: Alignment.bottomLeft, fontSize: 17, maxLine: 1,)),
                    Expanded(child: CustomText(txt: controller.productModel[index].brand.toString() , color:Colors.grey, fontSize: 15,alignment: Alignment.bottomLeft, maxLine: 1, )),
                    Expanded(child: CustomText(txt: controller.productModel[index].price.toString()+" EGP" , alignment: Alignment.bottomLeft,color: primaryColor,fontSize: 17  ,maxLine: 1, )),

                  ],

                ),
              ),
            );

          }, separatorBuilder: ( context,  index) => SizedBox(width: 20,),




        ),

      ),

    );
 }


}