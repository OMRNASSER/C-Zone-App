import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/core/view_model/credit_controller.dart';
import 'package:untitled/view/Widget/custom_Button.dart';
import 'package:untitled/view/Widget/custom_text_form_field.dart';

class GetCreditView extends GetView<CreditController> {

  int? editFlag = 1 ;
  String? docId ='' ;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreditController>(
      init: Get.put(CreditController()),
      builder:(controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          // leading: IconButton( onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios_rounded)),

          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
          ),
          toolbarHeight: MediaQuery.of(context).size.height * .25  ,
          title: Container(
            height: 75.0,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.0),
              color:primaryColor ,
            ),
            child: Image.asset('assets/images/credit-card.png' ,
              height: 60.0, width: 60.0,),
          ),
          centerTitle: true,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: controller.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Card(
                      elevation: 2.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 16.0 , right: 16.0 , top: 16.0 , ) ,
                            child: CustomTextForm(
                              hint: "OMAR NASSER",
                              txt:'Name on Card',
                              color: Colors.grey,
                              controller: controller.nameController,
                              onSaved: (value){

                              },
                              validator: (value){
                                return controller.validateName(value!);

                              },
                              obsecure: false,
                              focusColor: primaryColor,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 16.0 , right: 16.0 , top: 16.0 , ) ,
                            child: CustomTextForm(
                              hint: "5123 0089 XXXX 4569",
                              txt:'Card Number',
                              color: Colors.grey,
                              controller: controller.numberController,
                              onSaved: (value){

                              },
                              validator: (value){
                                return controller.validateNumber(value!);
                              },
                              obsecure: false,
                              focusColor: primaryColor,
                              icon: const Icon(Icons.credit_card),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 16.0 , right: 16.0 , top: 16.0 , ) ,
                            child: CustomTextForm(
                              hint: "05/24",
                              txt:'Expiration Date',
                              color: Colors.grey,
                              controller: controller.experationDateController,
                              onSaved: (value){

                              },
                              validator: (value){
                                return controller.validateDate(value!);
                              },
                              obsecure: false,
                              focusColor: primaryColor,

                            ),


                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 16.0 , right: 16.0 , top: 16.0 , ) ,
                            child: CustomTextForm(
                              hint: "044",
                              txt:'CVV',
                              color: Colors.grey,
                              controller: controller.cvvController,
                              onSaved: (value){

                              },
                              validator: (value){
                               return controller.validateCVV(value!);
                              },
                              obsecure: true,
                              focusColor: primaryColor,

                            ),


                          ),

                          const SizedBox(height: 40.0,),

                        ],
                      ),
                    ),
                  ),
                  Padding(

                    padding: const EdgeInsets.all(20.0),
                    child: CustomButton(

                      txt: "Save Card",
                      color: primaryColor,

                      onPressed: (){

                        controller.saveUpdateCard(
                            controller.nameController.text ,
                            controller.numberController.text ,
                            controller.experationDateController.text ,
                            controller.cvvController.text,
                            docId! ,
                            editFlag! ,

                        );


                      },
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
