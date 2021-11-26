import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/auth_repository.dart';
import 'package:parceragem/app/mock/profession.dart';
import 'package:parceragem/app/presentation/features/create_order/controller/create_order_controller.dart';
import 'package:parceragem/app/presentation/shared/components/layout.dart';
import 'package:parceragem/app/presentation/shared/theme/app_colors.dart';
import 'package:parceragem/app/presentation/shared/theme/app_typography.dart';

class CreateOrder extends GetView<CreateOrderController> {
  @override
  Widget build(BuildContext context) {
    controller.findTasks();
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
                    height: 50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(state[index].name,
                            style: AppTypography.normalPrimaryWhite),
                      ),
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: state[index].id,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Column(
                            children: [
                              Text("Informações adicionais ${state[index].id}"),
                            ],
                          ),
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
                  onPressed: () => controller.findTasks(),
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
