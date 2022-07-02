import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/core/view_model/home_view_model.dart';
import 'package:untitled/helper/extension.dart';
import 'package:untitled/model/cart_product_model.dart';
import 'package:untitled/model/product_model.dart';
import 'package:untitled/view/Widget/CustomText.dart';
import 'package:untitled/view/Widget/custom_Button.dart';
import 'package:untitled/view/control_view.dart';

import '../Constant.dart';
import '../core/view_model/cart_view_model.dart';
import 'Home_Screen.dart';

class DetailsView extends StatelessWidget {
  ProductModel model ;
  DetailsView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.centerLeft,


                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                      child: Image.network(model.image.toString() , fit: BoxFit.fill)
                  ),


                  IconButton(onPressed: (){
                  Get.offAll(ControlView()) ;

                  }, icon:Icon(Icons.arrow_back_ios,),
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(width: 200,),

                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: IconButton(onPressed: (){
                  //
                  //   }, icon:Icon(Icons.stars,size:35 ,),
                  //     alignment: Alignment.centerRight,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 10,),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        CustomText(txt: model.name.toString(),fontSize: 26,),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(250),
                              border: Border.all(color: Colors.grey.shade400),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              CustomText(txt: 'Size',),

                              CustomText(txt: model.sized.toString(),fontWeight: FontWeight.bold,)
                            ],),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * .45,
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(250.0),
                              border: Border.all(color: Colors.grey.shade400),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              CustomText(txt: 'Color',),
                                Container(
                                  width: 35,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(150.0),
                                    border: Border.all(color: Colors.grey.shade300),
                                    color: model.color
                                  ),
                                ),


                            ],),
                          ),


                        ],),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(10.0),
                            child: CustomText(txt: 'Details', fontWeight: FontWeight.bold,fontSize: 18,)),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomText(txt: model.description.toString(),fontSize: 14,height: 2.5,),
                        ),
                       Padding(
                         padding: const EdgeInsets.all(3.0),
                         child: Row(

                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                           Column(
                             children: [
                               CustomText(txt:'PRICE', fontSize: 12, color: Colors.grey.shade500,),
                               CustomText(txt: 'EGP ' + model.price.toString(), color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold,)
                             ],
                           ),
                           GetBuilder<CartViewModel>(
                             init: Get.find<CartViewModel>(),
                             builder:(controller) =>  Container(
                               padding: EdgeInsets.all(20.0),
                               width:220  ,
                                 height: 100,
                                 child: CustomButton(
                                     txt: 'ADD'   ,
                                     color: primaryColor ,
                                     onPressed: ()=>controller.addProduct(
                                       CartProductModel(
                                         name: model.name ,
                                         image: model.image ,
                                         price: model.price ,
                                         quantity: 1 ,
                                         productId : model.productId,
                                       )
                                     )),
                             ),
                           ),

                         ],),
                       )

                      ],
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
