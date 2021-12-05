import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../shared/components/layout.dart';
import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_typography.dart';

import 'controller/my_orders_controller.dart';

class MyOrdersPage extends GetView<MyOrdersController> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "Meus Serviços",
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/create-order");
        },
        child: Icon(
          Icons.add,
          size: 40,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.secondaryCardAlt,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 32,
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            controller.obx(
              (state) {
                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return cardItem(
                      state[index].id,
                      state[index].task.profession.section.name,
                      state[index].task.profession.name,
                      state[index].task.name,
                      DateFormat('dd/MM/yyyy').format(state[index].date),
                      state[index].hour,
                      state[index].price.toString(),
                      state[index].status,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget cardItem(
    String id,
    String section,
    String profession,
    String task,
    String date,
    String hour,
    String price,
    String status,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            gradient: AppColors.blueCardGradient,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$section - $profession",
                      style: AppTypography.titleCard,
                    ),
                    Text(
                      "R\$ $price",
                      style: AppTypography.titleCard,
                    )
                  ],
                ),
                SizedBox(height: 5),
                Divider(
                  color: AppColors.whiteColor,
                  thickness: 1,
                ),
                SizedBox(height: 5),
                Text(
                  "Serviço: $task",
                  style: AppTypography.subtitleCard,
                ),
                SizedBox(height: 5),
                Text(
                  "Data: $date : $hour",
                  style: AppTypography.subtitleCard,
                ),
                SizedBox(height: 5),
                Text(
                  "Status: $status",
                  style: AppTypography.subtitleCard,
                ),
                SizedBox(height: 5),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        child: Icon(
                          Icons.remove_circle,
                          size: 32,
                          color: AppColors.white,
                        ),
                        onTap: () {
                          controller.cancelOrder(id);
                        },
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.mode_edit,
                          size: 32,
                          color: AppColors.white,
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
