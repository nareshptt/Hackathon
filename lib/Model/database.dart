import 'package:firestore_ref/firestore_ref.dart';

class DatabaseMethos {
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

  Future deleteFarmerDetails(
    String id,
  ) async {
    return await FirebaseFirestore.instance
        .collection("Farmer")
        .doc(id)
        .delete();
  }
}
