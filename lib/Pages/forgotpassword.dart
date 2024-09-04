import 'package:farmconnect/Pages/UIHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForGotPassword extends StatefulWidget {
  const ForGotPassword({super.key});

  @override
  State<ForGotPassword> createState() => _ForGotPasswordState();
}

class _ForGotPasswordState extends State<ForGotPassword> {
  TextEditingController emailController = TextEditingController();

  forgotPassword(String email) async {
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orange,
          content: Text("Please enter your email!!!")));
    } else {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text("Password reset email sent successfully!")));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content:
                Text("Failed to send password reset email: ${e.toString()}")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            UIHelper.CustomTextfield(
                emailController, "Enter Email ", Icons.email, false),
            SizedBox(
              height: 20,
            ),
            UIHelper.CustomButton(() {
              forgotPassword(emailController.text.toString());
            }, "Reset"),
          ],
        ),
      ),
    );
  }
}
