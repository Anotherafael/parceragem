import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/presentation/shared/theme/app_colors.dart';

import '../../../shared/components/layout.dart';

class HomeClient extends StatefulWidget {
  const HomeClient({Key? key}) : super(key: key);

  @override
  _HomeClientState createState() => _HomeClientState();
}

class _HomeClientState extends State<HomeClient> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/order-request/sections');
              },
              child: Card(
                color: AppColors.secondaryAlt,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.calendar_today_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Agende agora mesmo!",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
