import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/presentation/features/orders/controllers/section_filter_controller.dart';
import 'package:parceragem/app/presentation/shared/components/layout.dart';
import 'package:parceragem/app/presentation/shared/theme/AppColors.dart';
import 'package:parceragem/app/presentation/shared/theme/AppFonts.dart';

import 'profession_filter.dart';

class SectionFilter extends GetView<SectionFilterController> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      body: controller.obx(
        (state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      "/professionfilter",
                      parameters: {"id": state[index].id},
                    );
                  },
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
