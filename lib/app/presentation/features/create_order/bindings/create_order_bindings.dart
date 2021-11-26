import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/task_repository.dart';
import 'package:parceragem/app/infra/core/http/parceragem_client.dart';
import 'package:parceragem/app/infra/repositories/i_task_repository_impl.dart';
import 'package:parceragem/app/presentation/features/create_order/controller/create_order_controller.dart';

class CreateOrderBindings extends Bindings{
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<TaskRepository>(ITaskRepositoryImpl(client));
    Get.put(CreateOrderController(Get.find()));
  }
}