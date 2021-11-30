import 'package:get/get.dart';
import 'package:parceragem/app/domain/core/failures/server_failures.dart';
import 'package:parceragem/app/domain/repositories/auth_repository.dart';

class AppBarController extends GetxController{ 
  final AuthRepository repository;
  AppBarController(this.repository);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> logout() async{
    try {
      final result = await repository.logout();
      result.fold(
        (l) {
          switch (l) {
            case ServerFailures.notFound:
              Get.defaultDialog(title: 'Not Found');
              break;
            case ServerFailures.serverError:
              Get.defaultDialog(
                title: 'Something went wrong...',
                middleText: " ",
              );
              break;
          }
        },
        (r) {
          Get.offAllNamed("/");
        },
      );
    } catch (e) {
      print(e);
    }
  }
  }
