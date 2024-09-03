import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Farmconnect',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.notifications_sharp)
          ],
        ),
      ),
      drawer: Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)),
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    "Farm Product",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                      "A durable and reliable fram product for all your needs.")
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
