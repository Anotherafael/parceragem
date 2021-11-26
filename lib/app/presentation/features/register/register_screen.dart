import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/presentation/shared/components/widgets/custom_text_field.dart';
import 'package:parceragem/app/presentation/shared/theme/app_colors.dart';
import 'controller/register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  final String? provider = Get.parameters['provider'];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController docController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(32),
            child: Card(
              color: AppColors.colorLightPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CustomTextField(
                      hint: 'Nome',
                      controller: nameController,
                      prefix: Icon(Icons.account_circle),
                      textInputType: TextInputType.emailAddress,
                      onChanged: (context) {},
                      enabled: true,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                      hint: 'E-mail',
                      controller: emailController,
                      prefix: Icon(Icons.alternate_email_rounded),
                      textInputType: TextInputType.emailAddress,
                      enabled: true,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                      hint: 'Senha',
                      prefix: Icon(Icons.lock),
                      controller: passwordController,
                      obscure: true,
                      // onChanged: loginStore.setPassword,
                      // enabled: !loginStore.loading,
                      // ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                      hint: 'Documento de identificação',
                      controller: docController,
                      prefix: Icon(Icons.picture_in_picture_outlined),
                      textInputType: TextInputType.emailAddress,
                      enabled: true,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                      hint: 'Fone',
                      controller: phoneController,
                      prefix: Icon(Icons.phone),
                      textInputType: TextInputType.emailAddress,
                      enabled: true,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      height: 44,
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            ((Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return AppColors.colorLightSecondary;
                              else
                                return AppColors.colorLightSecondary.withAlpha(
                                    100); // Use the component's default.
                            }),
                          ),
                        ),
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          controller.register(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                              docController.text,
                              phoneController.text,
                              provider!
                            );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
