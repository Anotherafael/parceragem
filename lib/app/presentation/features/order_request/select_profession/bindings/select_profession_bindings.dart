import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../../domain/repositories/profession_repository.dart';
import '../../../../../infra/core/http/parceragem_client.dart';
import '../../../../../infra/repositories/i_profession_repository.impl.dart';
import '../controller/select_profession_controller.dart';

class SelectProfessionBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<ProfessionRepository>(IProfessionRepositoryImpl(client));
    Get.put(SelectProfessionController(Get.find()));
  }
}
