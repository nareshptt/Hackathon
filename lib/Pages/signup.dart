import 'package:farmconnect/Pages/UIHelper.dart';
import 'package:farmconnect/Pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'bottomNavigation.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  signUP(
    String email,
    String password,
  ) async {
    if (email == "" || password == "") {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orange,
        content: Text("Please enter valid Credential"),
      ));
    } else {
      UserCredential? userCredential;

      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => BottumNavigation()));
        });
      } on FirebaseAuthException catch (ex) {
        return UIHelper.customAlert(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            Text(
              "Create account",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            UIHelper.CustomTextfield(
                emailControler, "Email", Icons.email, false),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(25)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                hint: Text('Select Role'),
                items: <String>['Buyer', 'Farmer'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle the selected value
                  if (newValue == null) {
                    // You can store this value in a variable or use it as needed
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.orange,
                      content: Text("Please Select Your role"),
                    ));
                  }
                },
              ),
            ),
            UIHelper.CustomTextfield(
                passwordControler, "Password", Icons.lock, true),
            SizedBox(
              height: 20,
            ),
            UIHelper.CustomButton(() {
              signUP(
                emailControler.text.toString(),
                passwordControler.text.toString(),
              );
            }, "Signup"),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => loginPage()));
                    },
                    child: Text("Login here")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
