import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/presentation/features/orders/controllers/profession_filter_controller.dart';
import '../../../shared/components/layout.dart';
import '../../../shared/theme/AppColors.dart';
import 'package:parceragem/app/presentation/shared/theme/AppFonts.dart';

class ProfessionFilter extends GetView<ProfessionFilterController> {
  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'];
    controller.findProfessions(id!);
    return Layout(
      body: controller.obx(
        (state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                      height: 50,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: AppColors.colorLightPrimary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(state[index].name,
                                style: AppFonts.normalPrimaryWhite)),
                      )),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
