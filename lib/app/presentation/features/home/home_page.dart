import 'package:flutter/material.dart';
import 'home_client.dart';
import 'home_professional.dart';
import '../../shared/theme/AppFonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomeClient()));
                        },
                        child: Icon(
                          Icons.account_box,
                          size: 80,
                        )),
                    Text("Sou cliente", style: AppFonts.normalPrimary)
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 100)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => HomeProfessional()));
                        },
                        child: Icon(Icons.badge, size: 80)),
                    Text("Sou Funcionário", style: AppFonts.normalPrimary)
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
