import 'package:get/get.dart';

import '../../../../../domain/core/failures/server_failures.dart';
import '../../../../../domain/repositories/section_repository.dart';

class SelectSectionController extends GetxController with StateMixin {
  final SectionRepository repository;

  SelectSectionController(this.repository);

  @override
  void onInit() {
    super.onInit();
    findSections();
  }

  Future<void> findSections() async {
    change([], status: RxStatus.loading());
    try {
      final result = await repository.getSections();
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
      change([], status: RxStatus.error('Erro ao buscar as áreas de serviços'));
    }
  }
}
