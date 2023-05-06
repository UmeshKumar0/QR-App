import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class GenerateQrScreenController extends GetxController {
  RxBool isGenerated = false.obs;
  RxString qrText = ''.obs;
  GlobalKey globalKey = GlobalKey();
  final formKey = GlobalKey<FormState>();

  Future<void> captureAndSharePng() async {
    try {
      String now = DateTime.now().toString().split('.')[0];

      RenderRepaintBoundary boundary =
          globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData byteData =
          await image.toByteData(format: ImageByteFormat.png) ?? ByteData(0);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/${now}_QR.png').create();
      await file.writeAsBytes(pngBytes);
      GallerySaver.saveImage(file.path, toDcim: true);
      Fluttertoast.showToast(
        msg: 'QR Code Saved',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Failed to save QR Code',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
