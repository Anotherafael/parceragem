import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/order_request_repository.dart';
import 'package:parceragem/app/infra/repositories/i_order_request_repository.dart';

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
    Get.put<OrderRequestRepository>(IOrderRequestRepositoryImpl(client));
    Get.put(SelectOrderController(Get.find(), Get.find()));
  }
}
