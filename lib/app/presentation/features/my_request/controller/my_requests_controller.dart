import 'package:get/get.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/repositories/order_request_repository.dart';

class MyRequestsController extends GetxController with StateMixin {
  final OrderRequestRepository repository;

  MyRequestsController(
    this.repository,
  );

  @override
  void onInit() {
    super.onInit();
    findOrderRequests();
  }

  Future<void> findOrderRequests() async {
    change([], status: RxStatus.loading());
    try {
      final result = await repository.getMyRequests();

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
      change([], status: RxStatus.error('Erro ao buscar os pedidos'));
    }
  }
}
