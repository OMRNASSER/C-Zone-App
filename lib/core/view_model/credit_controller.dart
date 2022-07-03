import 'package:untitled/core/view_model/creditcard_view_model.dart';
import 'package:untitled/core/services/creditcard_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/creditcard_model.dart';
import '../../view/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CreditController extends GetxController {

  late TextEditingController nameController, numberController, experationDateController, cvvController;
 
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
 
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 
  RxList<CreditCardModel> cards = RxList<CreditCardModel>([]);
 
  List<CreditCardModel> get creditCard => _creditCard;
 
  late CollectionReference getCollectionCreditRef;
 
  final List<CreditCardModel> _creditCard = [];

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    numberController = TextEditingController();
    experationDateController = TextEditingController();
    cvvController = TextEditingController();
    getCollectionCreditRef = firebaseFirestore.collection('CreditCards');
    cards.bindStream(getAllCredits());
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
  Stream<List<CreditCardModel>> getAllCredits() =>
      getCollectionCreditRef.snapshots().map((query) =>
          query.docs.map((item) => CreditCardModel.fromMap(item)).toList());


  String? validateName(String value) {
    if (value.isEmpty) {
      return "Name can be not empty";
    }
    return null;
  }

  String? validateNumber(String value) {
    if (value.isEmpty && value.length < 16 && value.length > 16) {
      return "Please Enter A Valid Number";
    }

    return null;
  }


  String? validateDate(String value) {
    if (value.isEmpty) {
      return "Please Enter A valid Date on The card ";
    }
    return null;
  }

  String? validateCVV(String value) {
    if (value.isEmpty && value.length < 3 && value.length > 3) {
      return "Please Enter A valid CVV Contain 3 numbers";
    }
    return null;
  }


  @override
  void onClose() {
    nameController.dispose();
    numberController.dispose();
    experationDateController.dispose();
    cvvController.dispose();
  }

  void clearEditing() {
    nameController.clear();
    numberController.clear();
    experationDateController.clear();
    cvvController.clear();
  }

  void saveUpdateCard(String name, String number, String expirationDate,
      String cvv, String docId, int addEditFlag) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    if (addEditFlag == 1) {
      getCollectionCreditRef.add({
        'cardHolder': name,
        'cardNumber': number,
        'cardExpiration': expirationDate
      }).whenComplete(() {
        clearEditing();
        Get.back();
        Get.find<CreditCardViewModel>();
        update();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Card Added",
            message: "Card added successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.green);
      });
      // } else if (addEditFlag == 2) {
      //   //update
      //   getCollectionCreditRef.doc(docId).update({'cardHolder': name, 'cardNumber': number , 'cardExpiration':expirationDate}).whenComplete(() {
      //
      //     clearEditing();
      //     Get.back();
      //     CustomSnackBar.showSnackBar(
      //         context: Get.context,
      //         title: "Employee Updated",
      //         message: "Employee updated successfully",
      //         backgroundColor: Colors.green);
      //   }).catchError((error) {
      //     CustomFullScreenDialog.cancelDialog();
      //     CustomSnackBar.showSnackBar(
      //         context: Get.context,
      //         title: "Error",
      //         message: "Something went wrong",
      //         backgroundColor: Colors.red);
      //   });
      // }
    }
  }

}