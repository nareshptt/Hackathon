import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:farmconnect/Pages/categories.dart';
import 'package:farmconnect/Pages/profile.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class BottumNavigation extends StatefulWidget {
  const BottumNavigation({super.key});

  @override
  State<BottumNavigation> createState() => _BottumNavigationState();
}

class _BottumNavigationState extends State<BottumNavigation> {
  int currentIndex = 0;

  late List<Widget> pages;
  late HomePage homepage;
  late Categories categories;

  late Profile profile;

  late Widget currentPage;

  @override
  void initState() {
    homepage = HomePage();
    categories = Categories();

    profile = Profile();

    pages = [HomePage(), Categories(), Profile()];
    currentPage = HomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: Colors.black,
          backgroundColor: Colors.white,
          height: 65,
          color: Color.fromARGB(255, 84, 87, 93),
          animationDuration: Duration(milliseconds: 420),
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.category,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
            ),
          ]),
      body: pages[currentIndex],
    );
  }
}
