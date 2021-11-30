import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'controller/create_order_controller.dart';
import '../../shared/components/layout.dart';
import '../../shared/components/widgets/custom_text_field.dart';
import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_typography.dart';

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
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.fromLTRB(20, 100, 20, 100),
                          child: Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            insetPadding: EdgeInsets.all(15.0),
                            backgroundColor: AppColors.primaryColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 16.0,
                                ),
                                Text(
                                  "Informações adicionais",
                                  style: AppTypography.titleCard,
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                Text(
                                  "Data",
                                  style: AppTypography.subtitleCard,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 180,
                                      child: CustomTextField(
                                        inputFormatters: [],
                                        prefix:
                                            Icon(Icons.calendar_today_outlined),
                                        hint: "24/01/2001",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 180,
                                      child: CustomTextField(
                                        inputFormatters: [],
                                        prefix:
                                            Icon(Icons.watch_later_outlined),
                                        hint: "22:00",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                Text(
                                  "Preço do serviço",
                                  style: AppTypography.subtitleCard,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: CustomTextField(
                                    inputFormatters: [],
                                    prefix: Icon(Icons.attach_money_outlined),
                                    hint: "1000",
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 44,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        ((Set<MaterialState> states) {
                                          if (states
                                              .contains(MaterialState.pressed))
                                            return AppColors.secondaryAlt
                                                .withAlpha(100);
                                          else
                                            return AppColors.secondaryAlt;
                                        }),
                                      ),
                                    ),
                                    child: Text(
                                      'Finalizar',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
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
