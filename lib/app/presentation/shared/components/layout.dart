import 'package:flutter/material.dart';
import 'package:parceragem/app/presentation/features/home/search.dart';
import 'package:parceragem/app/presentation/shared/theme/AppColors.dart';

import '../../features/home/home_client.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key, required this.body}) : super(key: key);
  final Widget body;
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int index = 0;
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
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.colorLightPrimary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        currentIndex: index,
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
    switch(i){
      case 0: 
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeClient()));
        break;
        case 1: 
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => Search()));
    }
  }
}
