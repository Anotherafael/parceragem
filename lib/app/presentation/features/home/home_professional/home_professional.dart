import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parceragem/app/presentation/shared/theme/app_colors.dart';
import 'package:parceragem/app/presentation/shared/theme/app_typography.dart';
import '../../../shared/components/layout.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              child: Card(
                color: AppColors.secondaryAlt,
                margin: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 32,
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
                          style: GoogleFonts.montserrat(
                              fontSize: 32, color: AppColors.whiteColor),
                        ),
                      ),
                    ],
                  ),
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
