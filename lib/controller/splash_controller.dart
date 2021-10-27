import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part "splash_controller.g.dart";

class SplashController = _SplashController with _$SplashController;

abstract class _SplashController with Store {
  @observable
  PageController pageController = PageController();

  @observable
  String loginRegister = "login";

  @action
  void switchToLogin() {
    pageController.animateToPage(0,
        duration: const Duration(seconds: 1), curve: Curves.bounceOut);
  }

  @action
  void switchToRegister() {
    pageController.animateToPage(1,
        duration: const Duration(seconds: 1), curve: Curves.bounceOut);
  }

  @action
  void setRegister() {
    loginRegister = "register";
  }

  @action
  void setLogin() {
    loginRegister = "login";
  }
}
