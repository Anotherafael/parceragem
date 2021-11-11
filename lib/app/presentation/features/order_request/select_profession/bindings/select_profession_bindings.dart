import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/i_profession_repository.dart';
import 'package:parceragem/app/infra/repositories/profession_repository.impl.dart';
import 'package:parceragem/app/presentation/features/order_request/select_profession/controller/select_profession_controller.dart';
import '../../../../../infra/core/http/ParceragemClient.dart';

class SelectProfessionBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<IProfessionRepository>(ProfessionRepositoryImpl(client));
    Get.put(SelectProfessionController(Get.find()));
  }
}
