import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part "controller_store.g.dart";

class ControllerStore = _ControllerStore with _$ControllerStore;

abstract class _ControllerStore with Store {
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
