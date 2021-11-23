import 'package:get/get.dart';

import '../../../../../domain/core/failures/server_failures.dart';
import '../../../../../domain/repositories/task_repository.dart';

class SelectTaskController extends GetxController with StateMixin {
  final TaskRepository repository;

  SelectTaskController(this.repository);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> findTasks(String id) async {
    change([], status: RxStatus.loading());
    try {
      final result = await repository.getTasks(id);
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
