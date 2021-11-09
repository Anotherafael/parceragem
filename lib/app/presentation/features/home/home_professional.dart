import 'package:flutter/material.dart';
import 'package:parceragem/app/presentation/features/orders/section_filter.dart';
import 'package:parceragem/app/presentation/shared/components/layout.dart';
import 'package:parceragem/app/presentation/shared/theme/AppColors.dart';

class HomeProfessional extends StatefulWidget {
  const HomeProfessional({Key? key}) : super(key: key);

  @override
  _HomeProfessionalState createState() => _HomeProfessionalState();
}

class _HomeProfessionalState extends State<HomeProfessional> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
          ),
            FloatingActionButton(onPressed: (){

            },
            child: const Icon(Icons.add),
            backgroundColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
