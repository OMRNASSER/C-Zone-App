

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/model/creditcard_model.dart';

class CreditCardServices {

  final CollectionReference _creditCardCollectionRef  = FirebaseFirestore.instance.collection('CreditCards');


  Future <List<QueryDocumentSnapshot>> getCredit() async{
    var value = await _creditCardCollectionRef.get() ;
    return value.docs ;
  }

  Future addCreditToFireStore(CreditCardModel creditCardModel)async{

    return await _creditCardCollectionRef.doc(creditCardModel.docId).set(creditCardModel.toJson()) ;

  }






}