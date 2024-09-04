import 'package:firestore_ref/firestore_ref.dart';

class DatabaseMethos {
  Future addProductDetails(
      Map<String, dynamic> ProductInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Products")
        .doc(id)
        .set(ProductInfoMap);
  }

  Future<Stream<QuerySnapshot>> getProductsDetails() async {
    return await FirebaseFirestore.instance.collection("Products").snapshots();
  }

  Future updateProductDetails(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Products")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteProductDetails(
    String id,
  ) async {
    return await FirebaseFirestore.instance
        .collection("Products")
        .doc(id)
        .delete();
  }

  // for user details

  Future addFarmerDetails(Map<String, dynamic> FarmerInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Farmer")
        .doc(id)
        .set(FarmerInfoMap);
  }

  Future<Stream<QuerySnapshot>> getFarmerDetails() async {
    return await FirebaseFirestore.instance.collection("Farmer").snapshots();
  }

  Future updateFarmerDetails(String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Farmer")
        .doc(id)
        .update(updateInfo);
  }

  Future FarmerDetails(
    String id,
  ) async {
    return await FirebaseFirestore.instance
        .collection("Farmer")
        .doc(id)
        .delete();
  }
}
