import 'package:flutter/material.dart';

import '../../features/home/home_logged.dart';
import '../../features/home/home_page.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int index = 0;
  final List<Widget> screens = [HomeLogged(), HomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Icon(
          Icons.people_alt_rounded,
          size: 80,
        ),
        centerTitle: true,
      ),
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: 0,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search")
        ],
      ),
    );
  }

  void onTabTapped(int i) {
    setState(() {
      index = i;
    });
  }
}
