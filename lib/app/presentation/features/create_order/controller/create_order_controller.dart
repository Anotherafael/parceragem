import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/order_repository.dart';
import '../../../../domain/core/failures/server_failures.dart';
import '../../../../domain/repositories/task_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateOrderController extends GetxController with StateMixin {
  final TaskRepository repository;
  final OrderRepository repo;
  CreateOrderController(this.repository, this.repo);
  final haveText = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await findTasks();
  }

  Future<void> addOrder(String taskId, double price, String date, String hour) async{
    try {
      final result = await repo.addOrder(
        {
          "task_id": taskId,
          "price": price,
          "date": date,
          "hour": hour
        }
      );
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
    }
  }

  Future<void> findTasks() async {
    change([], status: RxStatus.loading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final id = prefs.getString('profession');
      final result = await repository.getTasks(id!);
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
      change([], status: RxStatus.error('Erro ao buscar os serviços'));
    }
  }
}
