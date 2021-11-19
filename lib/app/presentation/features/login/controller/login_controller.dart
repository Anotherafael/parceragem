import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/i_auth_repository.dart';

class LoginController extends GetxController with StateMixin{
  final IAuthRepository repository;
  LoginController(this.repository);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onReady() {
    // isLogged?
    super.onReady();
  }

  void login() async{
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    //Criar verificação
    // if (user != null) {
    //   Get.toNamed("/home/client");
    // }
  }

  void register() async {
    Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
    //Registrar usuario
    // if (user != null) {
    //   Get.toNamed("/home/client");
    // }
  }

}