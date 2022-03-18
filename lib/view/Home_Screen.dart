import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Constant.dart';
import 'package:untitled/view/Widget/CustomText.dart';
import 'package:untitled/view/auth/login_screen.dart';

class Home_Screen extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final List<String> names = <String>["Men","S","S","S","S"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body:Container(
        padding: EdgeInsets.only(top:70  ,left: 20 , right:29),
        child: Column(
          children: [

               _searchTextFormField(),
                SizedBox(height: 50,),
                CustomText(txt:"Categories"),
                SizedBox(height: 50,),
                _listViewCategory(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(txt : "Best Selling" , fontSize: 22),

                    CustomText(txt : "See all" , fontSize: 20),



                  ],


                ),
                SizedBox(height: 20,),
                _listViewProducts(),

                Center(child:
                  FlatButton(
                    onPressed: () {
                    _auth.signOut();
                    Get.offAll(LoginScreen());
                  },
                    child:Text("Log Out"),
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
  Widget _listViewCategory(){
    return Container(
      height: 100,
      child: ListView.separated(
        itemCount: names.length,
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
                  child: Image.asset("assets/images/suit.png"),
                ),

              ),
              SizedBox(width: 20,),
            ],

          );

        }, separatorBuilder: ( context,  index) => SizedBox(width: 20,),



      ),

    ) ;
  }

 Widget _listViewProducts() {
    return Container(
      height: 350,
      child: ListView.separated(
        itemCount: names.length,
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
                width: MediaQuery.of(context).size.width * 0.4,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/images/suit.png"),
                ),

              ),
              SizedBox(width: 20,),
            ],

          );

        }, separatorBuilder: ( context,  index) => SizedBox(width: 20,),



      ),

    );
 }

}