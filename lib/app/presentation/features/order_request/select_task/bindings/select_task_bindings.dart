import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../../domain/repositories/i_task_repository.dart';
import '../../../../../infra/core/http/ParceragemClient.dart';
import '../../../../../infra/repositories/task_repository_impl.dart';
import '../controller/select_task_controller.dart';

class SelectTaskBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<ITaskRepository>(TaskRepositoryImpl(client));
    Get.put(SelectTaskController(Get.find()));
  }
}
