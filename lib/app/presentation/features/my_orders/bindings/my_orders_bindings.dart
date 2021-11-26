import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/order_repository.dart';
import 'package:parceragem/app/infra/core/http/parceragem_client.dart';
import 'package:parceragem/app/infra/repositories/i_order_repository_impl.dart';
import 'package:parceragem/app/presentation/features/my_orders/controller/my_orders_controller.dart';

class MyOrdersBindings implements Bindings {
  ParceragemClient client = new ParceragemClient();

  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<OrderRepository>(IOrderRepositoryImpl(client));
    Get.put(MyOrdersController(Get.find()));
  }
}
