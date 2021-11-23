import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/auth_repository.dart';
import 'package:parceragem/app/infra/core/http/parceragem_client.dart';
import 'package:parceragem/app/infra/repositories/auth_repository_impl.dart';
import 'package:parceragem/app/presentation/features/login/controller/login_controller.dart';

class LoginBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<IAuthRepository>(AuthRepositoryImpl(client));
    Get.put(LoginController(Get.find()));
  }
}
