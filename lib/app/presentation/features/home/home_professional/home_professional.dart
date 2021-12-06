import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/components/layout.dart';
import '../../../shared/theme/app_colors.dart';

class HomeProfessional extends StatefulWidget {
  const HomeProfessional({Key? key}) : super(key: key);

  @override
  _HomeProfessionalState createState() => _HomeProfessionalState();
}

class _HomeProfessionalState extends State<HomeProfessional> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
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
                        "Meus\nserviços!",
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
              onTap: () {
                Get.toNamed("/myorders");
              },
            ),
          ),
        ],
      ),
    );
  }
}
