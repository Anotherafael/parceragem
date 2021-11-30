import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../domain/repositories/order_request_repository.dart';
import '../../../../infra/core/http/parceragem_client.dart';
import '../../../../infra/repositories/i_order_request_repository.dart';
import '../controller/my_requests_controller.dart';

class MyRequestsBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<OrderRequestRepository>(IOrderRequestRepositoryImpl(client));
    Get.put(MyRequestsController(Get.find()));
  }
}
