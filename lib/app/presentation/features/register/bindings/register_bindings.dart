import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../../../../infra/core/http/parceragem_client.dart';
import '../../../../infra/repositories/i_auth_repository_impl.dart';
import '../controller/register_controller.dart';

class RegisterBindings implements Bindings {
  ParceragemClient client = ParceragemClient();
  void dependencies() {
    Get.put(Dio());
    Get.put<AuthRepository>(IAuthRepositoryImpl(client));
    Get.put(RegisterController(Get.find()));
  }
}
