import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../../domain/repositories/i_profession_repository.dart';
import '../../../../../infra/core/http/ParceragemClient.dart';
import '../../../../../infra/repositories/profession_repository.impl.dart';
import '../controller/select_profession_controller.dart';

class SelectProfessionBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<IProfessionRepository>(ProfessionRepositoryImpl(client));
    Get.put(SelectProfessionController(Get.find()));
  }
}
