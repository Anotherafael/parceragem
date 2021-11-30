import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../../domain/repositories/order_repository.dart';
import '../../../../infra/core/http/parceragem_client.dart';
import '../../../../infra/repositories/i_order_repository_impl.dart';
import '../controller/my_orders_controller.dart';

class MyOrdersBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<OrderRepository>(IOrderRepositoryImpl(client));
    Get.put(MyOrdersController(Get.find()));
  }
}
