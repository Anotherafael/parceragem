import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        backgroundColor: AppColors.primaryColor,
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

  void onTabTapped(int i) async {
    switch (i) {
      case 0:
        final prefs = await SharedPreferences.getInstance();
        if (prefs.getString("provider") == "users") {
          Get.offAllNamed("/home/client");
        } else {
          Get.offAllNamed("/home/professional");
        }
        break;
      case 1:
        Get.offAllNamed("/");
    }
  }
}
