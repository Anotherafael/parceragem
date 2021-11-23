import 'package:get/get.dart';

import '../../../../../domain/core/failures/server_failures.dart';
import '../../../../../domain/repositories/i_order_repository.dart';

class SelectOrderController extends GetxController with StateMixin {
  final IOrderRepository repository;

  SelectOrderController(this.repository);

  @override
  void onInit() {
    super.onInit();
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
