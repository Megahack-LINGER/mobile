import 'package:cloud_firestore/cloud_firestore.dart';

class GetProduct {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future getProducts() async {
    return await firebaseFirestore.collection("products").get();
  }

  Future getProduct(String idProduct) async {
    return await firebaseFirestore.collection("products").doc(idProduct).get();
  }
}
