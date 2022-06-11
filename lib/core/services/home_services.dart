import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {

  final CollectionReference _categoryCollectioRef  = FirebaseFirestore.instance.collection('Category') ;

  Future <List<QueryDocumentSnapshot>> getCategory() async {
     var value  =  await _categoryCollectioRef.get() ;

      return value.docs ;

    }


}