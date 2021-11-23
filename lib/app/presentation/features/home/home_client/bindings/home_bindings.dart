import 'package:get/get.dart';

import '../../../../../infra/core/http/parceragem_client.dart';

class HomeBindinds implements Bindings {
  @override
  void dependencies() {
    Get.put(ParceragemClient());
  }
}
