import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../../domain/repositories/i_section_repository.dart';
import '../../../../../infra/core/http/ParceragemClient.dart';
import '../../../../../infra/repositories/section_repository_impl.dart';
import '../controller/select_section_controller.dart';

class SelectSectionBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<ISectionRepository>(SectionRepositoryImpl(client));
    Get.put(SectionFilterController(Get.find()));
  }
}
