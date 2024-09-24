import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedlocation = 'Select location';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(top: 20, left: 2, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Farmconnect',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins"),
              ),
              Icon(Icons.notifications_active)
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        child: DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text('Ahemdabad'),
                              value: 'Ahemdabad',
                            ),
                            DropdownMenuItem(
                              child: Text('Baroda'),
                              value: 'Baroda',
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedlocation = value!;
                            });
                          },
                          hint: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.location_on),
                              Text('Now'),
                            ],
                          ),
                        ),
                      ),
                      border: InputBorder.none,
                      hintText: '$selectedlocation'),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Suggestions',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"),
                    ),
                    GestureDetector(
                      child: Text(
                        'See All',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Categories('images/auto.png'),
                    Categories(
                      'images/jcb.png',
                    ),
                    Categories(
                      'images/jcb.png',
                    ),
                    Categories('images/auto.png'),
                    Categories('images/auto.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container Categories(String image) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(top: 5, bottom: 5, right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        ),
      ),
    );
  }
}
