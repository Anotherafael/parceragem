import 'package:flutter/material.dart';
import '../../shared/components/layout.dart';
import '../../shared/theme/AppFonts.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
                        style: AppFonts.normalPrimaryWhite))
              ]),
            ),
          )
        ],
      ),
    );
  }
}
