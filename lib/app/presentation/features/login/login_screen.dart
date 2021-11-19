import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/presentation/shared/components/widgets/custom_icon_button.dart';
import 'package:parceragem/app/presentation/shared/components/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      TextFormField(
                        // controller: _loginController.emailTextController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Campo obrigatório.";
                          } else if (!GetUtils.isEmail(value)) {
                            return "Campo requer um E-mail válido.";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: "E-mail",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        // controller: _loginController.passwordTextController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Campo obrigatório.";
                          } else if (value.length < 6) {
                            return "Campo requer mínimo 6 caracteres.";
                          }
                          return null;
                        },
                        autofocus: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Senha",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                                  return Theme.of(context)
                                      .primaryColor
                                      .withAlpha(
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
                            //TODO Verificar
                            Get.toNamed("/home/clients");
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
