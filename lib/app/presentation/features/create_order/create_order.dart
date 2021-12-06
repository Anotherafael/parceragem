import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'controller/create_order_controller.dart';
import '../../shared/components/layout.dart';
import '../../shared/components/widgets/custom_text_field.dart';
import '../../shared/theme/app_colors.dart';
import '../../shared/theme/app_typography.dart';

// ignore: must_be_immutable
class CreateOrder extends GetView<CreateOrderController> {
  final TextEditingController moneyController = TextEditingController();
  String? data;
  String? hora;
  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "Criando um novo Serviço",
      body: controller.obx(
        (state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: GestureDetector(
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
                    decoration: BoxDecoration(
                      gradient: AppColors.violetCardGradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(state[index].name,
                          style: AppTypography.titleCard),
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
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: DateTimePicker(
                                      decoration: InputDecoration(
                                        fillColor: AppColors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                      ),
                                      type: DateTimePickerType.dateTimeSeparate,
                                      dateMask: 'd MMM, yyyy',
                                      initialValue: DateTime.now().weekday ==
                                              DateTime.friday
                                          ? DateTime.now()
                                              .add(Duration(days: 3))
                                              .toString()
                                          : DateTime.now().weekday ==
                                                  DateTime.thursday
                                              ? DateTime.now()
                                                  .add(Duration(days: 4))
                                                  .toString()
                                              : DateTime.now()
                                                  .add(Duration(days: 2))
                                                  .toString(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                      icon: Icon(Icons.event),
                                      dateLabelText: 'Date',
                                      timeLabelText: "Hour",
                                      selectableDayPredicate: (date) {
                                        // Disable weekend days to select from the calendar
                                        if (date.weekday == 6 ||
                                            date.weekday == 7 ||
                                            date.isBefore(DateTime.now())) {
                                          return false;
                                        }
                                        return true;
                                      },
                                      onChanged: (val) {
                                        data = DateFormat("yyyy-MM-dd")
                                            .format(DateTime.parse(val));
                                        //data = DateTime.parse(val);
                                        hora = DateFormat.Hms()
                                            .format(DateTime.parse(val));
                                        print([data, hora]);
                                      }
                                      //onSaved: (val) => print(DateFormat.Hms().format(DateTime.parse(val!))),
                                      ),
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
                                    controller: moneyController,
                                    inputFormatters: [],
                                    prefix: Icon(Icons.attach_money_outlined),
                                    hint: "1000",
                                    onChanged: (text) {
                                      if (text.isNotEmpty)
                                        controller.haveText.value = true;
                                      else
                                        controller.haveText.value = false;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 44,
                                  width: 150,
                                  child: Obx(
                                    () => ElevatedButton(
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
                                            if (states.contains(
                                                MaterialState.pressed))
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
                                      onPressed: controller.haveText.value
                                          ? () {
                                              controller.addOrder(
                                                  state[index].id,
                                                  double.parse(
                                                      moneyController.text),
                                                  data!,
                                                  hora!);
                                              Get.offAllNamed("/myorders");
                                            }
                                          : null,
                                    ),
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
        onLoading: CircularProgressIndicator(),
        onEmpty: CircularProgressIndicator(),
        onError: (error) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Qualquer coisa"),
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
