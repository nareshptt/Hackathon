import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        backgroundColor: Colors.green,
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => loginPage()));
          });
        },
      ),
      appBar: AppBar(
        title: Text("Profile"),
      ),
    );
  }
}
