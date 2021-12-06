import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/presentation/shared/components/widgets/custom_text_field.dart';
import 'package:parceragem/app/presentation/shared/theme/app_colors.dart';
import 'package:parceragem/app/presentation/shared/theme/app_typography.dart';

import '../../shared/components/layout.dart';
import 'controller/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  get onPressed => null;
  static late String provider;

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: "Meu Perfil",
      body: controller.obx(
        (state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              card(
                controller,
                context,
                "Nome",
                state.name,
              ),
              card(
                controller,
                context,
                "Telefone",
                state.phone,
              ),
              Container(
                height: 45,
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.secondaryCardAlt),
                  ),
                  onPressed: () {},
                  child: Text("Mudar senha"),
                ),
              ),
              Visibility(
                visible: (provider == "professionals"),
                child: Container(
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.secondaryCardAlt),
                    ),
                    onPressed: () {
                      Get.toNamed("/add-profession");
                    },
                    child: Text("Adicionar Profissão"),
                  ),
                ),
              ),
              Container(
                height: 45,
                margin: EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.dangerAlt),
                  ),
                  onPressed: () {
                    controller.logout();
                    Get.offAllNamed("/");
                  },
                  child: Text(
                    "Desconectar",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        onError: (error) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(error!),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget card(
    ProfileController controller,
    context,
    String title,
    String text,
  ) {
    IconData icon = Icons.person;
    if (title == "Telefone") {
      icon = Icons.phone;
    }
    TextEditingController inputController = TextEditingController();
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 32),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.secondaryCardAlt,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: AppColors.white,
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: AppTypography.profileCardTitle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    text,
                    style: AppTypography.profileCardSubtitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                useSafeArea: true,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    title: Text(
                      "Mudar $title",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 18,
                      ),
                    ),
                    actions: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextField(
                              hint: "$text",
                              controller: inputController,
                              prefix: Icon(icon),
                              textInputType: TextInputType.name,
                              enabled: true,
                              validator: "email",
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Center(
                              child: GestureDetector(
                                child: Text(
                                  "Confirmar",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.success,
                                      decoration: TextDecoration.underline),
                                ),
                                onTap: () {
                                  if (title == "Nome") {
                                    title = "name";
                                  } else if (title == "Telefone") {
                                    title = "phone";
                                  }
                                  controller.updateMe(
                                      inputController.text, title);
                                  Get.offAllNamed("/me");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.edit,
              size: 24,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }
}
