import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void onInit() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward()
          ..repeat(reverse: true);
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.addListener(() {
      update();
    });

    super.onInit();
  }
  @override
  void dispose() {
    animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
