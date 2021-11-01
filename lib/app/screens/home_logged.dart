import 'package:flutter/material.dart';

class HomeLogged extends StatefulWidget {
  const HomeLogged({ Key? key }) : super(key: key);

  @override
  _HomeLoggedState createState() => _HomeLoggedState();
}

class _HomeLoggedState extends State<HomeLogged> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Card(
            color: Colors.blueAccent,
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                )
              ]
            ),
          ),
        )
      ],
    );
  }
}