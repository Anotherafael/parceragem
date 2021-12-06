import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/theme/app_colors.dart';

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
      title: "",
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/order-request/sections');
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 32, 16, 16),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                decoration: BoxDecoration(
                  gradient: AppColors.blueCardGradient,
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      color: AppColors.whiteColor,
                      size: 100,
                    ),
                    Transform.rotate(
                      angle: 50,
                      child: Text(
                        "Agende\nserviços!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 30,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
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
