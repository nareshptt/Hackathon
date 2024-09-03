import 'package:farmconnect/Pages/home.dart';
import 'package:farmconnect/Pages/login.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return checkUser();
  }

  checkUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return loginPage();
    } else {
      return homePage();
    }
  }
}
