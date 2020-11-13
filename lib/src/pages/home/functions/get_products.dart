import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class GetProduct {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future getProducts() async {
    final currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true);
    currentPosition;

    final coordinates =
        Coordinates(currentPosition.latitude, currentPosition.longitude);

    final city = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    print("-------------------------------------------");
    try {
      print("Estado: " + city[0].adminArea);
      print("Cordenada: ${city[0].coordinates}");
      print("Cidade: " + city[0].subAdminArea);
    } catch (e) {
      print(e);
    }
    print("-------------------------------------------");

    //.where("cidade", isEqualTo: city)

    return await firebaseFirestore
        .collection("products")
        .where("cidade", isEqualTo: city[0].subAdminArea)
        .get();
  }

  Future getProduct(String idProduct) async {
    return await firebaseFirestore.collection("products").doc(idProduct).get();
  }
}
