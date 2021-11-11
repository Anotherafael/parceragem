import 'package:get/get.dart';

import '../../../../../infra/core/http/ParceragemClient.dart';

class HomeBindinds implements Bindings {
  @override
  void dependencies() {
    Get.put(ParceragemClient());
  }
}
