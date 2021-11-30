import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/login_controller.dart';
import '../../shared/components/widgets/custom_text_field.dart';
import '../../shared/theme/app_colors.dart';

class LoginScreen extends GetView<LoginController> {
  final String? provider = Get.parameters['provider'];

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  gradient: AppColors.violetCardGradient,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CustomTextField(
                      inputFormatters: [],
                      hint: 'E-mail',
                      controller: emailController,
                      prefix: Icon(Icons.account_circle),
                      textInputType: TextInputType.emailAddress,
                      onChanged: (context) {},
                      enabled: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      inputFormatters: [],
                      hint: 'Senha',
                      prefix: Icon(Icons.lock),
                      controller: passwordController,
                      obscure: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 44,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.successAlt,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          controller.login(
                            emailController.text,
                            passwordController.text,
                            provider!,
                          );
                          passwordController.text = "";
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/register",
                            parameters: {'provider': provider!});
                      },
                      child: Text(
                        "Não possui uma conta? Cadastre-se aqui",
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
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
