import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:qr_application/app/common/custom_button.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

import '../controllers/scan_qr_screen_controller.dart';

class ScanQrScreenView extends GetView<ScanQrScreenController> {
  const ScanQrScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 300,
                  width: Get.width * 0.7,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  child: QrCamera(qrCodeCallback: (code) {
                    print(code);
                    controller.qrText.value = code ?? "No Data";
                  }),
                  // child: QRView(  #############previous code
                  //   formatsAllowed: [
                  //     BarcodeFormat.qrcode,
                  //     BarcodeFormat.aztec,
                  //     BarcodeFormat.code128,
                  //     BarcodeFormat.code39,
                  //     BarcodeFormat.code93,
                  //     BarcodeFormat.dataMatrix,
                  //     BarcodeFormat.ean13,
                  //     BarcodeFormat.ean8,
                  //     BarcodeFormat.codabar,
                  //     BarcodeFormat.itf,
                  //     BarcodeFormat.maxicode,
                  //     BarcodeFormat.pdf417,
                  //     BarcodeFormat.rss14,
                  //     BarcodeFormat.rssExpanded,
                  //     BarcodeFormat.unknown,
                  //     BarcodeFormat.upcA,
                  //     BarcodeFormat.upcE,
                  //     BarcodeFormat.upcEanExtension,
                  //   ],
                  //   key: controller.qrKey,
                  //   onQRViewCreated: controller.onQRViewCreated,
                  // ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  MyCustomButton(
                    text: "Toggle Flash",
                    onPressed: () async {
                      await controller.qrViewController?.toggleFlash();
                    },
                    icon: Icons.flash_on,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  MyCustomButton(
                    text: "Flip Camera",
                    onPressed: () async {
                      await controller.qrViewController?.flipCamera();
                    },
                    icon: Icons.flip_camera_android_outlined,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  // MyCustomButton(
                  //   text: "Pause Camera",
                  //   onPressed: () async {
                  //     await controller.qrViewController?.pauseCamera();
                  //   },
                  //   icon: Icons.pause,
                  // ),
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  // MyCustomButton(
                  //   text: "Resume Camera",
                  //   onPressed: () async {
                  //     await controller.qrViewController?.resumeCamera();
                  //   },
                  //   icon: Icons.play_arrow,
                  // ),
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  MyCustomButton(
                      text: "From Gallery",
                      onPressed: () async {
                        controller.scanQrFromGallery();
                      },
                      icon: Icons.image),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width * 0.8,
                height: 200.0,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 2.0),
                          blurRadius: 8.0,
                          spreadRadius: 2.0)
                    ]),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      "QR Text",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SelectableText(
                          controller.qrText.value,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyCustomButton(
                text: "Copy",
                onPressed: () async {
                  Clipboard.setData(
                          ClipboardData(text: controller.qrText.value))
                      .then((value) =>
                          Fluttertoast.showToast(msg: "Copied to Clipboard"));
                },
                icon: Icons.copy,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
