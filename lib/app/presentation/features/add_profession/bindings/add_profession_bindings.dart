import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/professional_repository.dart';
import 'package:parceragem/app/infra/core/http/parceragem_client.dart';
import 'package:parceragem/app/infra/repositories/professional_repository_impl.dart';
import 'package:parceragem/app/presentation/features/add_profession/controller/add_profession_controller.dart';

class AddProfessionBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<ProfessionalRepository>(ProfessionalRepositoryImpl(client));
    Get.put(AddProfessionController(Get.find()));
  }
}
