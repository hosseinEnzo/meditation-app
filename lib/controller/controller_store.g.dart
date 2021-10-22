// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControllerStore on _ControllerStore, Store {
  final _$pageControllerAtom = Atom(name: '_ControllerStore.pageController');

  @override
  PageController get pageController {
    _$pageControllerAtom.reportRead();
    return super.pageController;
  }

  @override
  set pageController(PageController value) {
    _$pageControllerAtom.reportWrite(value, super.pageController, () {
      super.pageController = value;
    });
  }

  final _$loginRegisterAtom = Atom(name: '_ControllerStore.loginRegister');

  @override
  String get loginRegister {
    _$loginRegisterAtom.reportRead();
    return super.loginRegister;
  }

  @override
  set loginRegister(String value) {
    _$loginRegisterAtom.reportWrite(value, super.loginRegister, () {
      super.loginRegister = value;
    });
  }

  final _$_ControllerStoreActionController =
      ActionController(name: '_ControllerStore');

  @override
  void switchToLogin() {
    final _$actionInfo = _$_ControllerStoreActionController.startAction(
        name: '_ControllerStore.switchToLogin');
    try {
      return super.switchToLogin();
    } finally {
      _$_ControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchToRegister() {
    final _$actionInfo = _$_ControllerStoreActionController.startAction(
        name: '_ControllerStore.switchToRegister');
    try {
      return super.switchToRegister();
    } finally {
      _$_ControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRegister() {
    final _$actionInfo = _$_ControllerStoreActionController.startAction(
        name: '_ControllerStore.setRegister');
    try {
      return super.setRegister();
    } finally {
      _$_ControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogin() {
    final _$actionInfo = _$_ControllerStoreActionController.startAction(
        name: '_ControllerStore.setLogin');
    try {
      return super.setLogin();
    } finally {
      _$_ControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageController: ${pageController},
loginRegister: ${loginRegister}
    ''';
  }
}
