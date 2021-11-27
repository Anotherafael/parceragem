import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/order_request_repository.dart';
import 'package:parceragem/app/infra/core/http/parceragem_client.dart';
import 'package:parceragem/app/infra/repositories/i_order_request_repository.dart';
import 'package:parceragem/app/presentation/features/my_request/controller/my_requests_controller.dart';

class MyRequestsBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<OrderRequestRepository>(IOrderRequestRepositoryImpl(client));
    Get.put(MyRequestsController(Get.find()));
  }
}
