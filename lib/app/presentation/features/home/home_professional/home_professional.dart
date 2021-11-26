import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryAlt,
                ),
                child: Text('My Orders'),
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
