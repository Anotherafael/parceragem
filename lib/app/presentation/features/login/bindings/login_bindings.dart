import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../../../../infra/core/http/parceragem_client.dart';
import '../../../../infra/repositories/i_auth_repository_impl.dart';
import '../controller/login_controller.dart';

class LoginBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<AuthRepository>(IAuthRepositoryImpl(client));
    Get.put(LoginController(Get.find()));
  }
}
