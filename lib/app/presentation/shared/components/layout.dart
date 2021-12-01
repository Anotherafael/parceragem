import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_colors.dart';
import 'widgets/custom_app_bar.dart';

// ignore: must_be_immutable
class Layout extends StatefulWidget {
  Layout({Key? key, required this.body, this.floatingActionButton, this.title})
      : super(key: key);
  final Widget body;
  final FloatingActionButton? floatingActionButton;
  String? title;
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int index = 0;

  late String user = "";
  void getUser() async {
    final prefs = await SharedPreferences.getInstance();
    user = prefs.getString("user")!;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title == null) {
      getUser();
      widget.title = "Boas vindas,\n$user";
    }
    getUser();
    return Scaffold(
      appBar: CustomAppbar(widget.title),
      backgroundColor: AppColors.primary,
      body: widget.body,
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget bottomBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.white,
            width: 2,
          ),
        ),
      ),
      child: BottomNavigationBar(
        showSelectedLabels: true,
        backgroundColor: AppColors.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        currentIndex: index,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 32,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: "Meus Pedidos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_rounded),
            label: "Perfil",
          )
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
        Get.offAllNamed("/myrequests");
        break;
      case 2:
        Get.offAllNamed("/perfil");
    }
  }
}
