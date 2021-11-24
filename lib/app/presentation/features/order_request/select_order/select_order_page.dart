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
      body: controller.obx(
        (state) {
          return ListView.builder(
            itemCount: state.length,
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
                        ],
                      ),
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
                          backgroundColor: AppColors.colorLightPrimary,
                          title: Text("Você tem certeza?"),
                          actions: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  ((Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed))
                                      return AppColors.colorLightCardColors
                                          .withAlpha(100);
                                    else
                                      return AppColors
                                          .colorLightCardColors; // Use the component's default.
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
                                Get.back();
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
    );
  }
}
