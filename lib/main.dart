import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/presentation/core/routes/app_routes.dart';
import 'app/presentation/features/home/select_provider_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SelectProviderPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      getPages: AppRoutes.pages,
    );
  }
}
