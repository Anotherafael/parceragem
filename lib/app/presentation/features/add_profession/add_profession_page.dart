import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/presentation/shared/components/layout.dart';
import 'package:parceragem/app/presentation/shared/theme/app_colors.dart';
import 'package:parceragem/app/presentation/shared/theme/app_typography.dart';

import 'controller/add_profession_controller.dart';

class AddProfessionPage extends GetView<AddProfessionController> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "Qual profissão?",
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
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                  shrinkWrap: false,
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(32, 32, 32, 0),
                      child: GestureDetector(
                        onTap: () {
                          controller.addProfession(state[index].id);
                          Get.offAllNamed("/me");
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
                ),
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
                      onPressed: () => controller.findProfessions(),
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
