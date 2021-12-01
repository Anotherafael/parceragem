import 'package:get/get.dart';
import '../../../../domain/core/failures/server_failures.dart';
import '../../../../domain/repositories/auth_repository.dart';
import '../../../../infra/models/auth_model.dart';

class LoginController extends GetxController {
  final AuthRepository repository;
  LoginController(this.repository);

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login(String email, String password, String provider) async {
    isLoading.value=true;
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
    } finally{
      isLoading.value=false;
    }
  }
}
