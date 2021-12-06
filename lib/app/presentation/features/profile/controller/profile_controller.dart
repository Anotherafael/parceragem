import 'package:get/get.dart';
import 'package:parceragem/app/domain/entities/user_entity.dart';
import 'package:parceragem/app/domain/repositories/auth_repository.dart';
import 'package:parceragem/app/domain/repositories/me_repository.dart';
import 'package:parceragem/app/infra/models/user_model.dart';
import '../../../../domain/core/failures/server_failures.dart';

class ProfileController extends GetxController with StateMixin {
  final MeRepository repository;
  final AuthRepository authRepository;

  ProfileController(
    this.repository,
    this.authRepository,
  );

  @override
  void onInit() {
    super.onInit();
    findMe();
  }

  Future<void> findMe() async {
    change([], status: RxStatus.loading());
    try {
      final result = await repository.getMe();

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
      change([], status: RxStatus.error('Erro ao buscar seus dados'));
    }
  }

  Future<void> updateMe(String text, String title) async {
    change([], status: RxStatus.loading());
    try {
      Map<String, dynamic> map = {
        "$title": text,
      };
      final result = await repository.updateMe(map);

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
      change([], status: RxStatus.error('Erro ao editar perfil'));
    }
  }

  Future<void> logout() async {
    change([], status: RxStatus.loading());
    try {
      final result = await authRepository.logout();

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
      change([], status: RxStatus.error('Erro ao editar perfil'));
    }
  }
}
