import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/core/view_model/credit_controller.dart';
import 'package:untitled/core/view_model/creditcard_view_model.dart';
import 'package:untitled/view/Widget/CustomText.dart';

import 'get_credit_view.dart';

class CreditCardsView extends StatelessWidget {


  List<Color>? color = [
    Color(0xFF090943) ,
    Colors.black ,
    Colors.blueAccent ,
    Colors.tealAccent ,
    Colors.black45 ,
    Colors.amber ,
    Colors.purpleAccent ,
    Colors.black26 ,
    Colors.grey ,
    Colors.purple ,
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreditCardViewModel>(
      init: Get.put(CreditCardViewModel()),
      builder:(controller) =>  Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          toolbarHeight:MediaQuery.of(context).size.height * .25 ,
          leadingWidth: 100.0,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true ,
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50.0),
            ),
          ),

          title: const CustomText(txt:"My Cards" , fontSize: 27.0, fontWeight: FontWeight.bold,  family:'Lato',),
          backgroundColor: Colors.white ,
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _buildAddCardButton(icon: const Icon(Icons.add , color: Colors.white,) , color: primaryColor),
            ),
          ],

        ),

        body: ListView.separated(
          itemCount: controller.creditCard.length,
          itemBuilder: (context , index){

          return Container(
            padding: const EdgeInsets.all(10.0),
           child:  Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  <Widget>[
                _buildCreditCard(
                  color: color![index] ,
                  cardHodler: controller.creditCard[index].cardHolder.toString().toUpperCase(),
                  cardExpiration: controller.creditCard[index].cardExpiration.toString() ,
                  cardNumber: controller.creditCard[index].cardNumber.toString(),
                ),
                // _buildCreditCard(
                //   color: const Color(0xFF000000) ,
                //   cardHodler: "HAMZA ABDELRAHMAN MOHAMED",
                //   cardExpiration: "05/24" ,
                //   cardNumber: "5614 0064 XXXX 5689" ,
                // ),


              ],
            )
          );



          } , separatorBuilder: (context ,builder) =>  SizedBox(height: 4.0,) ,
          ),
          ),
    );
  }

  Widget _buildAddCardButton({required Icon icon , required Color color}){
    return Container(
      height: 45.0,
      width: 45.0,

      padding: const EdgeInsets.only(top: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),

      ),
      child: FloatingActionButton(
        elevation: 2.0,
          onPressed: (){

          Get.to(GetCreditView());


          },
        child: icon,
        backgroundColor: color,
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
            CustomText(txt: cardNumber , fontSize: 21.0 , color: Colors.white , family: 'CourierRrime',  ),
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
