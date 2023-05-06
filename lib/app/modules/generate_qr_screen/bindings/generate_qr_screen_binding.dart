import 'package:get/get.dart';

import '../controllers/generate_qr_screen_controller.dart';

class GenerateQrScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenerateQrScreenController>(
      () => GenerateQrScreenController(),
    );
  }
}
