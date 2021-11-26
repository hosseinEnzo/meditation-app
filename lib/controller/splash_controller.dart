import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  PageController pageController = PageController();
  String loginRegister = "login";

  void switchToLogin() {
    pageController.hasClients?
    pageController.animateToPage(0,
        duration: const Duration(seconds: 1), curve: Curves.bounceOut):print("has not client");
    update();
  }

  void switchToRegister() {
    pageController.hasClients?
    pageController.animateToPage(1,
        duration: const Duration(seconds: 1), curve: Curves.bounceOut):print("has not client");
    update();
  }

  void setRegister() {
    loginRegister = "register";
    update();
  }

  void setLogin() {
    loginRegister = "login";
    update();
  }
}
