

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/model/creditcard_model.dart';


import '../../view/custom_snack_bar.dart';
import '../services/creditcard_services.dart';

class CreditCardViewModel extends GetxController {

  List<CreditCardModel> get creditCard => _creditCard;
  List<CreditCardModel> _creditCard = [];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference getCreditRef;

  late TextEditingController name, number, experationDate, cvv ;




  CreditCardViewModel() {
    getCreditCard();
  }


  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
    number = TextEditingController();
    experationDate = TextEditingController();
    cvv = TextEditingController();
    getCreditRef = firebaseFirestore.collection('CreditCards');
  }


  getCreditCard() async {
    CreditCardServices().getCredit().then((dynamic value) {
      for (int i = 0; i < value.length; i++) {
        _creditCard.add(CreditCardModel.fromJson(value[i].data()));
      }
      print(_creditCard.length);
      update();
    });
  }


  void  saveCreditCard(String name, String number, String experationDate,String Cvv){


  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Name can be not empty" ;

    }
    return null;
  }

  String? validateNumber(String value) {
    if (value.isEmpty && value.length < 16 && value.length > 16 ) {
      return "Please Enter A Valid Number" ;
    }

    return null;
  }


  String? validateDate(String value) {
    if (value.isEmpty) {
      return "Please Enter A valid Date on The card " ;

    }
    return null;
  }

  String? validateCVV(String value) {
    if (value.isEmpty && value.length < 3 && value.length > 3 ) {
      return "Please Enter A valid CVV Contain 3 numbers" ;

    }
    return null;
  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

  }

  void clearEditing() {

  }





}


