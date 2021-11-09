import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100, 100)
                      ),
                      onPressed: (){}, 
                      child: Icon(Icons.account_box, size: 80,)
                    ),
                  Text("Sou cliente", style: TextStyle(
                    fontSize: 12.0
                  ),)
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 100)
                    ),
                    onPressed: (){}, 
                    child: Icon(Icons.badge, size: 80)
                  ),
                  Text("Sou Funcionário", style: TextStyle(
                    fontSize: 12.0
                  ),)
                ],
              )
            ],
          ),
        ],
      );
  }
}