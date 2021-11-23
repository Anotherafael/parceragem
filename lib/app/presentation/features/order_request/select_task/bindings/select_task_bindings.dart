import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../../domain/repositories/task_repository.dart';
import '../../../../../infra/core/http/parceragem_client.dart';
import '../../../../../infra/repositories/i_task_repository_impl.dart';
import '../controller/select_task_controller.dart';

class SelectTaskBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<TaskRepository>(ITaskRepositoryImpl(client));
    Get.put(SelectTaskController(Get.find()));
  }
}
