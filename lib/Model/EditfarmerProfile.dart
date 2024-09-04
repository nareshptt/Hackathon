import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

import 'database.dart';

class Editfarmerprofile extends StatefulWidget {
  const Editfarmerprofile({super.key});

  @override
  State<Editfarmerprofile> createState() => _EditfarmerprofileState();
}

class _EditfarmerprofileState extends State<Editfarmerprofile> {
  final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? "";
  TextEditingController nameControler = TextEditingController();
  TextEditingController phonenoControler = TextEditingController();
  TextEditingController addControler = TextEditingController();

  addData(String name, String phone, String add) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (name == "" || phone == "" || add == "") {
      print(Text("Please Enter Data"));
    } else {
      String Id = randomAlphaNumeric(10);
      Map<String, dynamic> FarmerInfoMap = {
        "Name": nameControler.text,
        "Phone": phonenoControler.text,
        'userId': user != null ? user.uid : 'null',
        "Add": addControler.text
      };

      await DatabaseMethos().addFarmerDetails(FarmerInfoMap, Id).then((value) {
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text("Profile successfully updated!!!")));
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
                "Edit",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Profile",
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
                        hintText: "Enter name", border: InputBorder.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Phone",
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
                    controller: phonenoControler,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      hintText: "Enter Phoneno",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Address",
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
                    keyboardType: TextInputType.streetAddress,
                    controller: addControler,
                    decoration: InputDecoration(
                        hintText: "Add Address", border: InputBorder.none),
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
                                  phonenoControler.text.toString(),
                                  addControler.text.toString());
                            },
                            child: Text("Add"))))
              ],
            ),
          ),
        ]));
  }
}
