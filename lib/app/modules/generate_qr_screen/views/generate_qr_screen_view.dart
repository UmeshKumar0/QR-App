import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/generate_qr_screen_controller.dart';

class GenerateQrScreenView extends GetView<GenerateQrScreenController> {
  const GenerateQrScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                  width: double.infinity,
                ),
                const Text(
                  'Type here to generate create QR Code',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    controller.qrText.value = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Type here',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.primaries[2]),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        controller.isGenerated.value = true;
                        await Fluttertoast.showToast(
                            msg: 'QR Code Generated',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        controller.isGenerated.value = false;
                        Fluttertoast.showToast(
                            msg: 'Please enter some text',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    child: const Text('Generate QR Code')),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'QR Code will be generated here',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => controller.isGenerated.value
                      ? RepaintBoundary(
                          key: controller.globalKey,
                          child: QrImage(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            data: controller.qrText.value,
                            size: 200,
                          ),
                        )
                      : Container(
                          width: 200,
                          height: 200,
                          color: Colors.grey,
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    controller.captureAndSharePng();
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      width: 200,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Save QR Code",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
