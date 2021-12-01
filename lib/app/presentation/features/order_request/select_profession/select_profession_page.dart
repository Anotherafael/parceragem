import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/components/layout.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/theme/app_typography.dart';

import 'controller/select_profession_controller.dart';

class SelectProfessionPage extends GetView<SelectProfessionController> {
  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'];
    controller.findProfessions(id!);
    return Layout(
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
                    padding: EdgeInsets.fromLTRB(32, 32, 32, 0),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          "/order-request/tasks",
                          parameters: {"id": state[index].id},
                        );
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: AppColors.violetCardGradient,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black,
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              offset: Offset(0, 1.25),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            state[index].name,
                            style: AppTypography.orderSelectCard,
                          ),
                        ),
                      ),
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
                      onPressed: () => controller.findProfessions(id),
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
