
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/auth_repository.dart';
import 'package:parceragem/app/infra/core/http/parceragem_client.dart';
import 'package:parceragem/app/infra/repositories/i_auth_repository_impl.dart';
import 'package:parceragem/app/presentation/features/register/controller/register_controller.dart';

class RegisterBindings implements Bindings{
  ParceragemClient client = ParceragemClient();
  void dependencies() {
    Get.put(Dio());
    Get.put<AuthRepository>(IAuthRepositoryImpl(client));
    Get.put(RegisterController(Get.find()));
  }
}