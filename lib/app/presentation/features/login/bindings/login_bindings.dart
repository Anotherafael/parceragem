import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/i_auth_repository.dart';
import 'package:parceragem/app/infra/core/http/ParceragemClient.dart';
import 'package:parceragem/app/presentation/features/login/controller/login_controller.dart';

class LoginBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() { //IAuthRepositoryImpl?
    // Get.put(Dio());
    // Get.put<IAuthRepository>(IAuthRespositoryImpl(client));
    // Get.put(LoginController(Get.find()));
  }
}