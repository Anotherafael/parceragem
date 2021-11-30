import 'package:get/get.dart';
import '../../../../../domain/repositories/order_request_repository.dart';

import '../../../../../domain/core/failures/server_failures.dart';
import '../../../../../domain/repositories/order_repository.dart';

class SelectOrderController extends GetxController with StateMixin {
  final OrderRepository repository;
  final OrderRequestRepository repo;
  SelectOrderController(this.repository, this.repo);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> requestOrder(String id) async {
    change([], status: RxStatus.loading());
    try {
      final result = await repo.addOrderRequest(id);
      result.fold((l) {
        switch (l) {
          case ServerFailures.notFound:
            Get.defaultDialog(title: 'Not Found');
            break;
          case ServerFailures.serverError:
            Get.defaultDialog(title: 'Server Error');
            break;
        }
      }, (_) => change([]));
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao requisitar o serviço'));
    }
  }

  Future<void> findOrders(String id) async {
    change([], status: RxStatus.loading());
    try {
      final result = await repository.getPendingOrders(id);
      result.fold((l) {
        switch (l) {
          case ServerFailures.notFound:
            Get.defaultDialog(title: 'Not Found');
            break;
          case ServerFailures.serverError:
            Get.defaultDialog(title: 'Server Error');
            break;
        }
      }, (r) => change(r, status: RxStatus.success()));
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao buscar os profissionais'));
    }
  }
}
