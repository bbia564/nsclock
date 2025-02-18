import 'package:get/get.dart';

import 'clock_buut_logic.dart';

class ClockBuutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
