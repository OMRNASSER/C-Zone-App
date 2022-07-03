

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/model/creditcard_model.dart';


import '../../view/custom_screen_dialog.dart';
import '../../view/custom_snack_bar.dart';
import '../services/creditcard_services.dart';

class CreditCardViewModel extends GetxController {

  List<CreditCardModel> get creditCard => _creditCard;
  List<CreditCardModel> _creditCard = [];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference getCollectionCreditRef;

  late TextEditingController nameController, numberController , experationDateController, cvvController ;

   RxList<CreditCardModel> cards =RxList<CreditCardModel>([]);



  CreditCardViewModel() {
    getCreditCard();

  }


  @override



  getCreditCard() async {
    CreditCardServices().getCredit().then((dynamic value) {
      for (int i = 0; i < value.length; i++) {
        _creditCard.add(CreditCardModel.fromJson(value[i].data()));
      }
      print(_creditCard.length);
      update();
    });
  }



















}


