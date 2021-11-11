import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/i_profession_repository.dart';
import 'package:parceragem/app/infra/repositories/profession_repository.impl.dart';
import 'package:parceragem/app/presentation/features/orders/controllers/profession_filter_controller.dart';
import '../../../infra/core/http/ParceragemClient.dart';

class ProfessionFilterBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<IProfessionRepository>(ProfessionRepositoryImpl(client));
    Get.put(ProfessionFilterController(Get.find()));
  }
}
