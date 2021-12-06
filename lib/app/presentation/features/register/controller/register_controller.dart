import 'package:get/get.dart';
import '../../../../domain/core/failures/server_failures.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../../../../infra/models/auth_model.dart';

class RegisterController extends GetxController with StateMixin {
  final AuthRepository repository;
  RegisterController(this.repository);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> register(String name, String email, String password, String doc,
      String phone, String provider) async {
    change([], status: RxStatus.loading());
    try {
      final result = await repository.register(
        RegisterRequestModel(
            name: name,
            email: email,
            password: password,
            document: doc,
            phone: phone,
            provider: provider),
      );
      result.fold(
        (l) {
          switch (l) {
            case ServerFailures.notFound:
              Get.defaultDialog(title: 'Not Found');
              break;
            case ServerFailures.serverError:
              Get.defaultDialog(
                title: 'Erro ao cadastrar',
                middleText: "O email/Documento já existem",
              );
              break;
          }
        },
        (r) {
          change(r, status: RxStatus.success());
          Get.offAllNamed("/");
        },
      );
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao autenticar'));
    }
  }
}
