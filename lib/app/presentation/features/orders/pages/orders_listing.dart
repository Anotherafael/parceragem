import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../mock/Order.dart';
import '../../../../mock/professional.dart';
import '../../../shared/components/layout.dart';
import '../../../shared/theme/AppColors.dart';
import '../../../shared/theme/AppFonts.dart';

class OrderListing extends StatefulWidget {
  const OrderListing({Key? key}) : super(key: key);
  @override
  _OrderListingState createState() => _OrderListingState();
}

class _OrderListingState extends State<OrderListing> {
  final int taskId = Get.arguments;
  late List ordersList = [];
  @override
  void initState() {
    super.initState();
    for (var item in orders) {
      if (item['task_id'] == taskId) ordersList.add(item);
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
