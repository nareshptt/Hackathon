import 'package:cloud_firestore/cloud_firestore.dart'; // Fixed missing import
import 'package:farmconnect/Model/AddProduct.dart';
import 'package:farmconnect/Model/EditfarmerProfile.dart';
import 'package:farmconnect/Pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? "";

  // Define a query to fetch farmer data
  late final Query farmerQuery = FirebaseFirestore.instance
      .collection('Farmer')
      .where('userId', isEqualTo: currentUserId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddProductPage()));
        },
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Profile"),
            GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginPage()));
                },
                child: Icon(Icons.logout))
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: farmerQuery.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            var farmerData =
                snapshot.data!.docs.first.data() as Map<String, dynamic>;
            var name = farmerData['Name'] ?? 'Name not available';
            var phone = farmerData['Phone'] ?? 'Phone not available';
            var address = farmerData['Add'] ?? 'Address not available';

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/user.jpeg'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Farmer',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text(FirebaseAuth.instance.currentUser?.email ??
                        'Email not available'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(phone),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(address),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Editfarmerprofile()));
                    },
                    child: Text('Edit Profile'),
                  ),

                  // Add a list of farmer's products here
                ],
              ),
            );
          } else {
            // Return a default widget if no data is available
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/user.jpeg'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'No data available',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Please edit your profile to add data.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Editfarmerprofile()));
                    },
                    child: Text('Edit Profile'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
