import 'package:flutter/material.dart';
import 'package:parceragem/app/mock/Order.dart';
import 'package:parceragem/app/mock/professional.dart';
import 'package:parceragem/app/presentation/shared/components/layout.dart';
import 'package:parceragem/app/presentation/shared/theme/AppColors.dart';
import 'package:parceragem/app/presentation/shared/theme/AppFonts.dart';

class OrderListing extends StatefulWidget {
  const OrderListing({ Key? key, required this.taskId }) : super(key: key);
  final int taskId;
  @override
  _OrderListingState createState() => _OrderListingState();
}

class _OrderListingState extends State<OrderListing> {
  late List ordersList=[];
  @override
  void initState() {
    super.initState();
    for (var item in orders) {
      if(item['task_id']==widget.taskId)
        ordersList.add(item);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Layout(
      body: ListView.builder(
        itemCount: ordersList.length,
        itemBuilder: (context, index){
          return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                child: SizedBox(
                  height: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.colorLightPrimary,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text(ordersList[index]['price'].toString(), style: AppFonts.normalPrimaryWhite)),
                  )
                ),
              )
            );
        }
        ),
    );
  }
}