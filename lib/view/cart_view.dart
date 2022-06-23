import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/core/view_model/cart_view_model.dart';
import 'package:untitled/view/Widget/custom_Button.dart';

import 'Widget/CustomText.dart';



class CartView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Column(
          children: [
            Expanded(
              child: GetBuilder<CartViewModel>(
                init:Get.find<CartViewModel>() ,
                builder: (controller)=>Container(
                  child: ListView.separated(
                    itemBuilder: (context ,index){
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child:Row(
                          children: [
                            Container(
                              width: 150,
                                child: Image.network(controller.cartProductModel[index].image.toString() , fit: BoxFit.fill)),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left : 20.0 , ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(txt: controller.cartProductModel[index].name.toString(),fontSize: 16,),
                                    SizedBox(height: 6,),
                                    CustomText(txt: "EGP " + controller.cartProductModel[index].price.toString(),color: primaryColor, fontSize: 18 ,),
                                    SizedBox(height: 20,),
                                    //add number of products
                                    Container(
                                      width: 100,
                                      color: Colors.grey.shade200,
                                      alignment: Alignment.bottomRight,

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              controller.increaseQuantity(index) ;
                                            },
                                            child: Icon(Icons.add , color: Colors.black , size: 17,)
                                          ),
                                          SizedBox(width: 10,),
                                          CustomText(txt: controller.cartProductModel[index].quantity.toString(),  alignment: Alignment.center, fontSize: 17, color: Colors.black,),
                                          SizedBox(width: 10,),
                                          
                                          GestureDetector(
                                            onTap: ()=> controller.decreaseQuantity(index),
                                            child: Container(
                                              padding: EdgeInsets.only(bottom: 12),
                                                child: Icon(Icons.minimize, color: Colors.black ,size: 17, )),
                                          ),

                                        ],
                                      )
                                    ) ,

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ) ,
                      );
                    } ,
                    itemCount:controller.cartProductModel.length ,separatorBuilder: (BuildContext context , int index ){
                      return SizedBox(
                        height: 12,
                      );
                  },

                  ),
                ),
              ),
            ),
            Container(

              padding: EdgeInsets.all(17.0),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(txt: "TOTAL",
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      GetBuilder<CartViewModel>(
                        init:Get.find<CartViewModel>() ,
                        builder: (controller) =>  CustomText(
                          txt:  "EGP " + controller.totalPrice.toString(),
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 60,
                      width: 180,
                      child: CustomButton(txt: "CHECKOUT", color: primaryColor ,onPressed: (){},  )),

                ],
              ),

            ),

          ],
        ),
      ),
    ) ;
  }
}
