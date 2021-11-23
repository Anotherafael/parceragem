import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/presentation/features/login/controller/login_controller.dart';
import 'package:parceragem/app/presentation/shared/components/widgets/custom_text_field.dart';

class LoginScreen extends GetView<LoginController> {
  final String? provider = Get.parameters['provider'];

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                        hint: 'E-mail',
                        controller: emailController,
                        prefix: Icon(Icons.account_circle),
                        textInputType: TextInputType.emailAddress,
                        onChanged: (context) {},
                        enabled: true),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      hint: 'Senha',
                      prefix: Icon(Icons.lock),
                      controller: passwordController,
                      // obscure: !loginStore.passwordVisible,
                      // onChanged: loginStore.setPassword,
                      // enabled: !loginStore.loading,
                      // suffix: CustomIconButton(
                      //   radius: 32,
                      //   iconData: loginStore.passwordVisible ?
                      //     Icons.visibility_off : Icons.visibility,
                      //   onTap: loginStore.togglePasswordVisibility,
                      // ),
                    ),
                    const SizedBox(
                      height: 16,
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
                                return Theme.of(context).primaryColor;
                              else
                                return Theme.of(context).primaryColor.withAlpha(
                                    100); // Use the component's default.
                            }),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          controller.login(emailController.text,
                              passwordController.text, provider!);
                          passwordController.text = "";
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
