import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/core/view_model/creditcard_view_model.dart';
import 'package:untitled/view/Widget/CustomText.dart';

import 'Widget/custom_Button.dart';
import 'Widget/custom_text_form_field.dart';
import 'get_credit_view.dart';

class CreditCardsView extends GetWidget<CreditCardViewModel> {



  final List<Color> color = [
    Colors.deepPurple ,
    Colors.black ,
    Colors.black54 ,
    Colors.deepPurple.shade500 ,
    Colors.teal ,
    Colors.white38 ,
    Colors.amber ,
    Colors.black38 ,
  ];

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CreditCardViewModel>(
      init: Get.find<CreditCardViewModel>(),
      builder:(controller) =>Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        toolbarHeight:MediaQuery.of(context).size.height * .25 ,
        leadingWidth: 100.0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true ,
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50.0),
          ),

        ),

        title: CustomText(txt:"My Cards" , fontSize: 27.0, fontWeight: FontWeight.bold,  family:'Lato',),
        backgroundColor: Colors.white ,
        actions: [

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: _buildAddCardButton( icon: Icon(Icons.add , color: Colors.white,) , color: Color(0xFFFFFF) ,  ),
              ),
              // Container(
              //   height: 40.0,
              //   width: 40.0,
              //
              //   child: FloatingActionButton(
              //     elevation: 2.0,
              //     backgroundColor: primaryColor,
              //       onPressed:(){
              //         Get.to(GetCreditView());
              //       },
              //     child: Icon(Icons.arrow_forward_ios),
              //   ),
              //
              // )

            ],
          ),
        ],
      ),

      body: Container(
          padding: EdgeInsets.all(10.0),
         child:  ListView.separated(
            itemCount: controller.creditCard.length,
            itemBuilder: (context , index) {
              return _buildCreditCard(
                color: color[index],
                cardHodler: controller.creditCard[index].cardHolder.toString().toUpperCase(),
                cardExpiration: controller.creditCard[index].cardExpiration.toString(),
                cardNumber: controller.creditCard[index].cardNumber.toString(),
              );
              // _buildCreditCard(
              //   color: Color(0xFF000000) ,
              //   cardHodler: "HAMZA ABDELRAHMAN MOHAMED",
              //   cardExpiration: "05/24" ,
              //   cardNumber: "5614 0064 XXXX 5689" ,
              // ),


            },separatorBuilder: (context , index) => SizedBox(height: 10.0,) ,



          ),
        ),
      ),
    );
  }

  Widget _buildAddCardButton( {required Icon icon , required Color color  ,} ){
    return Container(
      width: 40.0,
      height: 40.0,


      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: FloatingActionButton(
        elevation: 2.0,

          onPressed: (){
          Get.bottomSheet(_buildAddCart(addEditFlag : 1  , docId:''));

          },
        child: icon,
        backgroundColor: primaryColor,
      ),


    );
  }
  Widget _buildAddCart({required int? addEditFlag, required String? docId}){
    return  SingleChildScrollView(
      child: Column(
        children: [
          Card(
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
                    onSaved: (value){

                    },
                    validator: (value){
                      if(value == null ){
                        print("Error");
                      }
                      else {
                        value.toUpperCase();
                      }
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
                    onSaved: (value){

                    },
                    validator: (value){
                      if(value == null ){
                        print("Error");
                      }
                    },
                    obsecure: false,
                    focusColor: primaryColor,
                    icon: Icon(Icons.credit_card),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16.0 , right: 16.0 , top: 16.0 , ) ,
                  child: CustomTextForm(
                    hint: "05/24",
                    txt:'Expiration Date',
                    color: Colors.grey,
                    onSaved: (value){

                    },
                    validator: (value){
                      if(value == null ){
                        print("Error");
                      }
                    },
                    obsecure: false,
                    focusColor: primaryColor,

                  ),


                ),
                SizedBox(height: 40.0,),
                Container(
                  padding: const EdgeInsets.only(left: 16.0 , right: 16.0 , top: 16.0 , ) ,
                  child: CustomTextForm(
                    hint: "044",
                    txt:'CVV',
                    color: Colors.grey,
                    onSaved: (value){

                    },
                    validator: (value){
                      if(value == null  ){
                        print("Error");
                      }
                      else if (value.length > 3  ){
                        Get.snackbar('Error', 'Please Enter 3 Number CVV of Your Credit Card');
                      }
                    },
                    obsecure: true,
                    focusColor: primaryColor,

                  ),


                ),

              ],
            ),
          ),
          Padding(

            padding: const EdgeInsets.all(20.0),
            child: CustomButton(

              txt: "Save Card",
              color: primaryColor,

              onPressed: (){

              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCreditCard(
      {required Color color,
      required String cardNumber,
      required String cardHodler,
      required String cardExpiration}){
    return Card(
      elevation: 4.0,
      color: color,
      shape : RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(20.0) ,
      ),
      child:Container(
        height: 200,
        padding: const   EdgeInsets.only(left: 16.0 , right: 16.0 , bottom: 22.0 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogoBlock(),
            CustomText(txt: "$cardNumber" , fontSize: 21.0 , color: Colors.white , family: 'CourierRrime',  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetailsBlock(
                  label: "CARDHOLDER" ,
                  value: cardHodler ,
                ),
                _buildDetailsBlock(
                  label: "VALID THRU" ,
                  value: cardExpiration ,
                ),
              ],
            ),


          ],



        ),


    ),


    );


  }
  Widget _buildLogoBlock(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/contact_less.png" , height: 20.0, width: 18.0, ),
          Image.asset("assets/images/mastercard.png" , height: 50.0, width: 50.0, ),
        ],
      ),
    );



  }
 Widget _buildDetailsBlock({required String label , required String value }){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          txt: label,
          fontSize: 9.0,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        CustomText(
          txt: value,
          fontSize: 15.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,

        ),
      ],
    );

 }

}
