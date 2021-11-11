import 'package:get/get.dart';
import 'package:parceragem/app/domain/repositories/i_profession_repository.dart';
import '../../../../../domain/core/failures/server_failures.dart';

class SelectProfessionController extends GetxController with StateMixin {
  final IProfessionRepository repository;

  SelectProfessionController(this.repository);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> findProfessions(String id) async {
    change([], status: RxStatus.loading());
    try {
      final result = await repository.getProfessions(id);
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
      change([], status: RxStatus.error('Erro ao buscar usuários'));
    }
  }
}
