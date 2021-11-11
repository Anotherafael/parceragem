import 'package:get/get.dart';
import 'package:parceragem/app/infra/core/http/ParceragemClient.dart';

class HomeBindinds implements Bindings {
  @override
  void dependencies() {
    Get.put(ParceragemClient());
  }
}
