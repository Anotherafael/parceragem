import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../domain/core/failures/server_failures.dart';
import '../../../../domain/repositories/order_request_repository.dart';

class MyRequestsController extends GetxController with StateMixin {
  final OrderRequestRepository repository;
  late String? provider;
  MyRequestsController(
    this.repository,
  );

  @override
  void onInit() async {
    super.onInit();
    await findOrderRequests();
    await getProvider();
  }
  getProvider() async {
    final prefs = await SharedPreferences.getInstance();
    provider = prefs.getString("provider");
  }  

  Future<void> acceptRequest(int id) async {
    try {
      final result = await repository.acceptRequest(id);

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

  Future<void> rejectRequest(int id) async {
    try {
      final result = await repository.rejectRequest(id);

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
