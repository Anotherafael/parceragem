import 'package:flutter/material.dart';
import 'package:parceragem/app/mock/Order.dart';
import 'package:parceragem/app/mock/professional.dart';
import 'package:parceragem/app/presentation/shared/components/layout.dart';
import 'package:parceragem/app/presentation/shared/theme/AppColors.dart';
import 'package:parceragem/app/presentation/shared/theme/AppFonts.dart';
import 'dart:io';

class OrderListing extends StatefulWidget {
  const OrderListing({Key? key, required this.taskId}) : super(key: key);
  final int taskId;
  @override
  _OrderListingState createState() => _OrderListingState();
}

class _OrderListingState extends State<OrderListing> {
  late List ordersList = [];
  @override
  void initState() {
    super.initState();
    for (var item in orders) {
      if (item['task_id'] == widget.taskId) ordersList.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: ListView.builder(
        itemCount: ordersList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              child: SizedBox(
                height: 70,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.colorLightPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/person.png"),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                professionals
                                    .firstWhere((e) =>
                                        e['id'] ==
                                        ordersList[index]
                                            ['professional_id'])['name']
                                    .toString(),
                                style: AppFonts.normalPrimaryWhite,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                ordersList[index]['date'].toString(),
                                style: AppFonts.normalPrimaryWhite,
                              ),
                              Text(
                                " : ",
                                style: AppFonts.normalPrimaryWhite,
                              ),
                              Text(
                                ordersList[index]['hour'].toString(),
                                style: AppFonts.normalPrimaryWhite,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
