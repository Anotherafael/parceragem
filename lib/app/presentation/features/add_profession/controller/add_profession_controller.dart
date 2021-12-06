import 'package:get/get.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/repositories/professional_repository.dart';

class AddProfessionController extends GetxController with StateMixin {
  final ProfessionalRepository professionalRepository;

  AddProfessionController(this.professionalRepository);

  @override
  void onInit() {
    super.onInit();
    findProfessions();
  }

  Future<void> findProfessions() async {
    change([], status: RxStatus.loading());
    try {
      final result = await professionalRepository.getProfessions();
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

  Future<void> addProfession(String id) async {
    change([], status: RxStatus.loading());
    try {
      final result = await professionalRepository.addProfession(id);
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
      change([], status: RxStatus.error('Erro adicionar profissão'));
    }
  }
}
