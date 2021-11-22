import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        decoration: BoxDecoration(color: Colors.white),
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
                            minimumSize: Size(100, 100)),
                        onPressed: () {
                          Get.toNamed('/login', parameters: {'provider': "Cliente"});
                        },
                        child: Icon(
                          Icons.account_box,
                          size: 80,
                        )),
                    Text("Sou cliente", style: AppTypography.normalPrimary)
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 100)),
                        onPressed: () {
                          Get.toNamed('/login', parameters: {'provider': "Funcionario"});
                        },
                        child: Icon(Icons.badge, size: 80)),
                    Text("Sou Funcionário", style: AppTypography.normalPrimary)
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
