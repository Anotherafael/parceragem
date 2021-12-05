import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/theme/app_colors.dart';

import '../../shared/components/layout.dart';
import '../../shared/theme/app_typography.dart';
import 'controller/my_requests_controller.dart';

class MyRequestPage extends GetView<MyRequestsController> {
  String? provider;
  void getUser() async {
    final prefs = await SharedPreferences.getInstance();
    provider = prefs.getString("provider");
  }  
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "Seus Pedidos",
      body: controller.obx(
        (state) {
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            itemCount: state.length,
            itemBuilder: (context, index) {
              getUser();
              String name;
              String nameType;
              if (provider == "professionals") {
                name = state[index].user.name;
                nameType = "Cliente";
              } else {
                name = state[index].order.professional.name;
                nameType = "Profissional";
              }
              return cardItem(
                state[index].id,
                state[index].order.task.profession.section.name,
                state[index].order.task.profession.name,
                state[index].order.task.name,
                DateFormat('dd/MM/yyyy').format(state[index].order.date),
                state[index].order.hour,
                state[index].order.price.toString(),
                state[index].status,
                name,
                nameType,
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
    );
  }

  Widget cardItem(
    int id,
    String section,
    String profession,
    String task,
    String date,
    String hour,
    String price,
    String status,
    String client,
    String nameType,
  ) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 32, 0, 0),
      height: 155,
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
          children: [
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
            Text(
              "$nameType: $client",
              style: AppTypography.subtitleCard,
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
              child: Visibility(
                visible: (status == "Pendente" && provider == "professionals"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(
                        Icons.remove_circle,
                        size: 32,
                        color: AppColors.white,
                      ),
                      onTap: (status == "Pendente" && provider == "professionals") ? () {
                        controller.rejectRequest(id);
                        controller.findOrderRequests();
                      } : null,
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.done,
                        size: 32,
                        color: AppColors.white,
                      ),
                      onTap: (status == "Pendente" && provider == "professionals") ? () {
                        controller.acceptRequest(id);
                        controller.findOrderRequests();
                      } : null,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
