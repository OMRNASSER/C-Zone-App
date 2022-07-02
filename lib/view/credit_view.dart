import 'package:flutter/material.dart';
import 'package:untitled/view/Widget/CustomText.dart';

class CreditCardsView extends StatelessWidget {
  const CreditCardsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
         child:  Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  <Widget>[
              _buildCreditCard(
                color: Color(0xFF090943) ,
                cardHodler: "OMAR ABDELNASSER AHMED",
                cardExpiration: "10/23" ,
                cardNumber: "5123 0089 XXXX 4569" ,
              ),
              _buildCreditCard(
                color: Color(0xFF000000) ,
                cardHodler: "HAMZA ABDELRAHMAN MOHAMED",
                cardExpiration: "05/24" ,
                cardNumber: "5614 0064 XXXX 5689" ,
              ),
              _buildAddCardButton(icon: Icon(Icons.add , color: Colors.white,) , color: Color(0xFF081603)),

            ],


          ),




        ),
      ),
    );
  }

  Widget _buildAddCardButton({required Icon icon , required Color color}){
    return Container(

      padding: const EdgeInsets.only(top: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),

      ),
      child: FloatingActionButton(
        elevation: 2.0,
          onPressed: (){
          print("Add a credit card ");
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
