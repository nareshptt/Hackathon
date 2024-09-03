import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import '../Pages/bottomNavigation.dart';
import 'database.dart';

class ProductService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addProduct(String name, double price, double rating) async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        String productId = randomAlphaNumeric(20);
        await _firestore.collection('products').doc(productId).set({
          'id': productId,
          'name': name,
          'price': price,
          'rating': rating,
          'userId': currentUser.uid,
          'createdAt': FieldValue.serverTimestamp(),
        });
      } else {
        throw Exception('No user logged in');
      }
    } catch (e) {
      print('Error adding product: $e');
      rethrow;
    }
  }
}

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController nameControler = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ratingControler = TextEditingController();

  addData(String name, String Age, String location) async {
    if (name == "" || Age == "" || location == "") {
      print(Text("Please Enter Data"));
    } else {
      String Id = randomAlphaNumeric(10);
      Map<String, dynamic> FarmerInfoMap = {
        "Name": nameControler.text,
        "Price": priceController.text,
        "Id": Id,
        "Rating": ratingControler.text
      };
      await DatabaseMethos().addFarmerDetails(FarmerInfoMap, Id).then((value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BottumNavigation()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Add",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Product",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        body: ListView(children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 30, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: nameControler,
                    decoration: InputDecoration(
                        hintText: "Enter product name",
                        border: InputBorder.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Price/kg",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    decoration: InputDecoration(
                      hintText: "Enter Price",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Quantity",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    controller: ratingControler,
                    decoration: InputDecoration(
                        hintText: "Add quantity", border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: Container(
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () async {
                              addData(
                                  nameControler.text.toString(),
                                  priceController.text.toString(),
                                  ratingControler.text.toString());
                            },
                            child: Text("Add"))))
              ],
            ),
          ),
        ]));
  }
}
