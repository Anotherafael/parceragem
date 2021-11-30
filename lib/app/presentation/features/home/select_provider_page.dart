import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/presentation/shared/theme/app_colors.dart';

import '../../shared/theme/app_typography.dart';

class SelectProviderPage extends StatefulWidget {
  const SelectProviderPage({Key? key}) : super(key: key);
  @override
  _SelectProviderPageState createState() => _SelectProviderPageState();
}

class _SelectProviderPageState extends State<SelectProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 100),
                        primary: AppColors.secondaryCardAlt,
                      ),
                      onPressed: () {
                        Get.toNamed(
                          '/login',
                          parameters: {'provider': "users"},
                        );
                      },
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 80,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Cliente",
                      style: AppTypography.providerCard,
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 100),
                          primary: AppColors.secondaryCardAlt),
                      onPressed: () {
                        Get.toNamed(
                          '/login',
                          parameters: {'provider': "professionals"},
                        );
                      },
                      child: Icon(
                        Icons.shopping_bag_rounded,
                        size: 80,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Parceiro",
                      style: AppTypography.providerCard,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
