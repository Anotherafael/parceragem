import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/me_repository.dart';
import 'package:parceragem/app/infra/repositories/me_repository_impl.dart';
import 'package:parceragem/app/presentation/features/profile/controller/profile_controller.dart';
import '../../../../infra/core/http/parceragem_client.dart';

class ProfileBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<MeRepository>(MeRepositoryImpl(client));
    Get.put(ProfileController(Get.find()));
  }
}
