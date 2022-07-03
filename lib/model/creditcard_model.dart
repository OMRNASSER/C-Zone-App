import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
class CreditCardModel{

String? cardNumber , cardHolder , cardExpiration  , docId ;


CreditCardModel({this.cardNumber, this.cardHolder, this.cardExpiration , this.docId });

CreditCardModel.fromJson(Map<dynamic , dynamic> map ){
  if (map == null ){
    return ;
  }
  docId = map['docId'] ;
  cardNumber = map['cardNumber'] ;
  cardHolder = map['cardHolder'] ;
  cardExpiration = map['cardExpiration'] ;



}
CreditCardModel.fromMap(DocumentSnapshot data) {
  docId = data.id;
  cardHolder = data["cardHolder"];
  cardNumber = data["cardNumber"];
  cardExpiration = data["cardExpiration"];


}
toJson(){
  return {
    'docId':docId ,
    'cardNumber':cardNumber ,
    'cardHolder':cardHolder ,
    'cardExpiration':cardExpiration ,

  };



}



}