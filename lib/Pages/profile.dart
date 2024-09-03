import 'package:farmconnect/Model/AddProduct.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          FirebaseAuth.instance.signOut().then((value) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddProductPage()));
          });
        },
      ),
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('images/user.jpeg'), // Replace with actual image
            ),
            SizedBox(height: 20),
            Text(
              'John Doe', // Replace with actual farmer name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Farmer', // Role
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('johndoe@example.com'), // Replace with actual email
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title:
                  Text('+1 234 567 8900'), // Replace with actual phone number
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                  '123 Farm Road, Countryside'), // Replace with actual address
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality to edit profile
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 20),
            Text(
              'My Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Add a list of farmer's products here
          ],
        ),
      ),
    );
  }
}
