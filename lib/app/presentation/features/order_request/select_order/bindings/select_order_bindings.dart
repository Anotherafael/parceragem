import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../../domain/repositories/order_repository.dart';
import '../../../../../infra/core/http/parceragem_client.dart';
import '../../../../../infra/repositories/i_order_repository_impl.dart';
import '../controller/select_order_controller.dart';

class SelectOrderBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<OrderRepository>(IOrderRepositoryImpl(client));
    Get.put(SelectOrderController(Get.find(), Get.find()));
  }
}
