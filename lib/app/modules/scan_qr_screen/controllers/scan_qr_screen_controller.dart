import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';

class ScanQrScreenController extends GetxController {
  final ScanController scanController = ScanController();
  QRViewController? qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  RxString qrText = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  onQRViewCreated(QRViewController qrViewController) {
    this.qrViewController = qrViewController;
    qrViewController.scannedDataStream.listen((scanData) {
      qrText.value = scanData.code ?? " ";
      if (kDebugMode) {
        print(scanData);
      }
    });
  }

  scanQrFromGallery() async {
    await qrViewController?.pauseCamera();
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      var text = await Scan.parse(pickedFile!.path);
      qrText.value = text ?? " ";
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      await qrViewController?.resumeCamera();
    }
  }
}
