import 'package:get/get.dart';
import '../../../../domain/core/failures/server_failures.dart';
import '../../../../domain/repositories/order_repository.dart';

class MyOrdersController extends GetxController with StateMixin {
  final OrderRepository repository;

  MyOrdersController(
    this.repository,
  );

  @override
  void onInit() {
    super.onInit();
    findOrders();
  }

  Future<void> findOrders() async {
    change([], status: RxStatus.loading());
    try {
      final result = await repository.getOrdersByProfessional();
      result.fold(
        (l) {
          switch (l) {
            case ServerFailures.notFound:
              Get.defaultDialog(title: 'Not Found');
              break;
            case ServerFailures.serverError:
              Get.defaultDialog(title: 'Server Error');
              break;
          }
        },
        (r) => change(
          r,
          status: RxStatus.success(),
        ),
      );
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao buscar as profissões'));
    }
  }
}
