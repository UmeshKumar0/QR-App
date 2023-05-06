import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_application/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 0, 5, 66),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/qr_code.gif',
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    'Welcome to ',
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    speed: const Duration(milliseconds: 500),
                  )
                ]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedIcon(
                  icon: AnimatedIcons.play_pause,
                  progress: controller.animationController,
                  color: Colors.yellow,
                  size: 30,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'QR Code App',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 250,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.SCAN_QR_SCREEN);
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.cyan),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: const Text('Scan QR Code'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Get.toNamed(Routes.GENERATE_QR_SCREEN);
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.cyan),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text('Generate QR Code')),
          ],
        ),
      ),
    );
  }
}
