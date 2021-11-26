import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/components/layout.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_typography.dart';
import 'controller/select_task_controller.dart';

class SelectTaskPage extends GetView<SelectTaskController> {
  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'];
    controller.findTasks(id!);
    return Layout(
      body: controller.obx(
        (state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(32, 24, 32, 0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      '/order-request/professionals',
                      parameters: {
                        "id": state[index].id,
                      },
                    );
                  },
                  child: SizedBox(
                      height: 50,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(state[index].name,
                                style: AppTypography.normalPrimaryWhite)),
                      )),
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
                  onPressed: () => controller.findTasks(id),
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
