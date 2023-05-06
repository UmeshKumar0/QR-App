import 'package:get/get.dart';

import '../controllers/scan_qr_screen_controller.dart';

class ScanQrScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanQrScreenController>(
      () => ScanQrScreenController(),
    );
  }
}
