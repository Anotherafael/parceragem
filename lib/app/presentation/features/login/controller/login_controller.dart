import 'package:get/get.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/repositories/i_auth_repository.dart';
import 'package:parceragem/app/infra/models/auth_model.dart';

class LoginController extends GetxController with StateMixin {
  final IAuthRepository repository;
  LoginController(this.repository);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login(String email, String password, String provider) async {
    change([], status: RxStatus.loading());
    try {
      final result = await repository.login(
        LoginRequestModel(
          email: email,
          password: password,
          provider: provider,
        ),
      );
      result.fold(
        (l) {
          switch (l) {
            case ServerFailures.notFound:
              Get.defaultDialog(title: 'Not Found');
              break;
            case ServerFailures.serverError:
              Get.defaultDialog(
                title: 'Wrong Credentials',
                middleText: "O usuário/senha informados não existem.",
              );
              break;
          }
        },
        (r) {
          change(r, status: RxStatus.success());
          switch (provider) {
            case "users":
              Get.toNamed("/home/client");
              break;
            case "professionals":
              Get.toNamed("/home/professional");
              break;
          }
        },
      );
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao autenticar'));
    }
  }

  Future<void> register() async {
    //Registrar usuario
    // if (user != null) {
    //   Get.toNamed("/home/client");
    // }
  }
}
