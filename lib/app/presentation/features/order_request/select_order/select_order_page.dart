import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../shared/components/layout.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_typography.dart';
import 'controller/select_order_controller.dart';

class SelectOrderPage extends GetView<SelectOrderController> {
  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'];
    controller.findOrders(id!);
    return Layout(
      title: "Esses são os serviços que encontramos.",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.white,
              size: 32,
            ),
          ),
          controller.obx(
            (state) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          gradient: AppColors.violetCardGradient,
                          borderRadius: BorderRadius.circular(15),
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
                                    image:
                                        AssetImage("assets/images/person.png"),
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
                                      state[index].professional.name,
                                      style: AppTypography.normalPrimaryWhite,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      DateFormat('dd-MM-yyyy')
                                          .format(state[index].date),
                                      style: AppTypography.normalPrimaryWhite,
                                    ),
                                    Text(
                                      " : ",
                                      style: AppTypography.normalPrimaryWhite,
                                    ),
                                    Text(
                                      state[index].hour.toString(),
                                      style: AppTypography.normalPrimaryWhite,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            VerticalDivider(
                              color: AppColors.white,
                              thickness: 1.5,
                            ),
                            Container(
                              child: Text(
                                "R\$ " + state[index].price.toString(),
                                textAlign: TextAlign.end,
                                style: AppTypography.orderSelectCard,
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              backgroundColor: AppColors.primaryColor,
                              title: Text("Você tem certeza?"),
                              actions: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      ((Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed))
                                          return AppColors.primaryAlt
                                              .withAlpha(100);
                                        else
                                          return AppColors
                                              .primaryAlt; // Use the component's default.
                                      }),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("Não"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.requestOrder(state[index].id);
                                    Get.offAllNamed("/home/client");
                                  },
                                  child: Text("Sim"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
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
                      onPressed: () => controller.findOrders(id),
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
}
