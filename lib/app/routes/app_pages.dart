import 'package:get/get.dart';

import '../modules/generate_qr_screen/bindings/generate_qr_screen_binding.dart';
import '../modules/generate_qr_screen/views/generate_qr_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/scan_qr_screen/bindings/scan_qr_screen_binding.dart';
import '../modules/scan_qr_screen/views/scan_qr_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.GENERATE_QR_SCREEN,
      page: () => const GenerateQrScreenView(),
      binding: GenerateQrScreenBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_QR_SCREEN,
      page: () => const ScanQrScreenView(),
      binding: ScanQrScreenBinding(),
    ),
  ];
}
