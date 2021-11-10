import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/presentation/features/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       getPages: [
//         GetPage(
//           name: '/',
//           page: () => HomePage(),
//           binding: HomeBindinds(),
//           children: [
//             GetPage(
//               name: '/get',
//               page: () => GetSectionsPage(),
//               binding: GetSectionsBindings(),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
