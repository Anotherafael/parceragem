import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/presentation/core/validation/validation_exception.dart';
import '../../shared/components/widgets/custom_text_field.dart';
import '../../shared/theme/app_colors.dart';
import 'controller/register_controller.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: must_be_immutable
class RegisterScreen extends GetView<RegisterController> {
  final String? provider = Get.parameters['provider'];
  final bool isClient = false;
  late dynamic formatter;
  late String textInputDocumentId;

  final maskPhone = MaskTextInputFormatter(
      mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});
  final maskCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final maskCNPJ = MaskTextInputFormatter(
      mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController documentController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (provider == "users") {
      textInputDocumentId = "CPF";
      formatter = maskCpf;
    } else {
      textInputDocumentId = "CNPJ";
      formatter = maskCNPJ;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(32),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppColors.violetCardGradient,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CustomTextField(
                      hint: 'Nome',
                      controller: nameController,
                      prefix: Icon(Icons.account_circle),
                      textInputType: TextInputType.name,
                      onChanged: (context) {},
                      enabled: true,
                      validator: "name",
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
                      validator: "email",
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                      hint: 'Senha',
                      prefix: Icon(Icons.lock),
                      controller: passwordController,
                      obscure: true,
                      validator: "password",
                      // onChanged: loginStore.setPassword,
                      // enabled: !loginStore.loading,
                      // ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                      inputFormatters: [formatter],
                      hint: textInputDocumentId,
                      controller: documentController,
                      prefix: Icon(Icons.picture_in_picture_outlined),
                      textInputType: TextInputType.number,
                      enabled: true,
                      validator: "document",
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    CustomTextField(
                      inputFormatters: [maskPhone],
                      hint: 'Fone',
                      controller: phoneController,
                      prefix: Icon(Icons.phone),
                      textInputType: TextInputType.number,
                      enabled: true,
                      validator: "phone",
                    ),
                    const SizedBox(
                      height: 20,
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
                                return AppColors.successAlt.withAlpha(100);
                              else
                                return AppColors
                                    .successAlt; // Use the component's default.
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
                          if (_formKey.currentState!.validate()) {
                            controller.register(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                              documentController.text,
                              phoneController.text,
                              provider!,
                            );
                          }
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
