import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';
import 'widgets/custom_app_bar.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key, required this.body, this.floatingActionButton})
      : super(key: key);
  final Widget body;
  final FloatingActionButton? floatingActionButton;
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
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
    switch (i) {
      case 0:
        Get.offAllNamed("/home/client");
        break;
      case 1:
        Get.offAllNamed("/");
    }
  }
}
