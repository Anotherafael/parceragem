import 'package:flutter/material.dart';
import '../../shared/components/layout.dart';
import '../../shared/theme/app_typography.dart';

class MyRequestPage extends StatefulWidget {
  const MyRequestPage({Key? key}) : super(key: key);

  @override
  _MyRequestPageState createState() => _MyRequestPageState();
}

class _MyRequestPageState extends State<MyRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Card(
              color: Colors.red,
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                ListTile(
                    leading: Icon(
                      Icons.warning,
                      color: Colors.white,
                    ),
                    title: Text("Work in progress",
                        style: AppTypography.normalPrimaryWhite))
              ]),
            ),
          )
        ],
      ),
    );
  }
}
