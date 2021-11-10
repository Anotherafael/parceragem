import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/i_section_repository.dart';
import 'package:parceragem/app/infra/core/http/ParceragemClient.dart';
import 'package:parceragem/app/infra/repositories/section_repository_impl.dart';

import 'get_sections_controller.dart';

class GetSectionsBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<ISectionRepository>(SectionRepositoryImpl(client));
    Get.put(GetSectionsController(Get.find()));
  }
}
