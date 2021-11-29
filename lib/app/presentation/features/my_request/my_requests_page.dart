import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:parceragem/app/presentation/shared/theme/app_colors.dart';

import '../../shared/components/layout.dart';
import '../../shared/theme/app_typography.dart';
import 'controller/my_requests_controller.dart';

class MyRequestPage extends GetView<MyRequestsController> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Meus Pedidos',
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
                    state[index].order.task.profession.section.name,
                    state[index].order.task.profession.name,
                    state[index].order.task.name,
                    DateFormat('dd/MM/yyyy').format(state[index].order.date),
                    state[index].order.hour,
                    state[index].order.price.toString(),
                    state[index].status,
                  );
                },
              );
            },
            onError: (error) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(error!),
                    TextButton(
                      onPressed: () => controller.findOrderRequests(),
                      child: Text('Tentar novamente'),
                    )
                  ],
                ),
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
    String status,
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
                  "Status: " + status,
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
