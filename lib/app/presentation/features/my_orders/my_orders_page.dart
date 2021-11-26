import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:parceragem/app/presentation/shared/components/layout.dart';
import 'package:parceragem/app/presentation/shared/theme/app_colors.dart';
import 'package:parceragem/app/presentation/shared/theme/app_typography.dart';

import 'controller/my_orders_controller.dart';

class MyOrdersPage extends GetView<MyOrdersController> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Meus Serviços',
                  style: AppTypography.titlePage,
                ),
              ),
            ],
          ),
          controller.obx(
            (state) {
              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                itemCount: state.length,
                itemBuilder: (context, index) {
                  return cardItem(
                    state[index].task.profession.section.name,
                    state[index].task.profession.name,
                    state[index].task.name,
                    DateFormat('dd-MM-yyyy').format(state[index].date),
                    state[index].hour,
                    state[index].price.toString(),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget cardItem(
    String section,
    String profession,
    String task,
    String date,
    String hour,
    String price,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 145,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: AppColors.secondaryAlt,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  section + " - " + profession,
                  style: AppTypography.titleCard,
                ),
                SizedBox(height: 5),
                Divider(
                  color: AppColors.whiteColor,
                  thickness: 1,
                ),
                Text(
                  "Serviço: " + task,
                  style: AppTypography.subtitleCard,
                ),
                SizedBox(height: 5),
                Text(
                  "Data: " + date + " : " + hour,
                  style: AppTypography.subtitleCard,
                ),
                SizedBox(height: 5),
                Text(
                  "Preço: " + price,
                  style: AppTypography.subtitleCard,
                ),
                SizedBox(height: 5),
                Text(
                  "Status: Pendente",
                  style: AppTypography.subtitleCard,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
