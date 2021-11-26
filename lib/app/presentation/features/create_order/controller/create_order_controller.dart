import 'package:get/get.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/repositories/task_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateOrderController extends GetxController with StateMixin{
final TaskRepository repository;

  CreateOrderController(this.repository);

  @override
  void onInit() {
    super.onInit();
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