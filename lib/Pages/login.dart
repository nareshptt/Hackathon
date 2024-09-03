import 'package:farmconnect/Pages/UIHelper.dart';
import 'package:farmconnect/Pages/forgotpassword.dart';
import 'package:farmconnect/Pages/home.dart';
import 'package:farmconnect/Pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  logIn(String email, String password) async {
    if (email == "" || password == "") {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orange,
        content: Text("Please enter valid Credential"),
      ));
    } else {
      UserCredential? userCredential;

      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => homePage()));
        });
      } on FirebaseAuthException catch (ex) {
        return AlertDialog(
          title: Text(ex.code.toString()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome back ",
            style: TextStyle(
                fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          UIHelper.CustomTextfield(emailControler, "Email", Icons.email, false),
          UIHelper.CustomTextfield(
              passwordControler, "Password", Icons.lock, true),
          SizedBox(
            height: 20,
          ),
          UIHelper.CustomButton(() {
            logIn(emailControler.text.toString(),
                passwordControler.text.toString());
          }, "Login"),
          SizedBox(
            height: 40,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForGotPassword()));
              },
              child: Text("Forgot Password ?")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signupPage()));
                  },
                  child: Text("Sigup here")),
            ],
          )
        ],
      ),
    );
  }
}
