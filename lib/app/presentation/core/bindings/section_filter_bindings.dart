import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../domain/repositories/i_section_repository.dart';
import '../../../infra/core/http/ParceragemClient.dart';
import '../../../infra/repositories/section_repository_impl.dart';
import '../../features/orders/controllers/section_filter_controller.dart';

class SectionFilterBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<ISectionRepository>(SectionRepositoryImpl(client));
    Get.put(SectionFilterController(Get.find()));
  }
}
