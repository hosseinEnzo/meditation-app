// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerStore on _PlayerStore, Store {
  final _$imageAdressAtom = Atom(name: '_PlayerStore.imageAdress');

  @override
  String get imageAdress {
    _$imageAdressAtom.reportRead();
    return super.imageAdress;
  }

  @override
  set imageAdress(String value) {
    _$imageAdressAtom.reportWrite(value, super.imageAdress, () {
      super.imageAdress = value;
    });
  }

  final _$songNameAtom = Atom(name: '_PlayerStore.songName');

  @override
  String get songName {
    _$songNameAtom.reportRead();
    return super.songName;
  }

  @override
  set songName(String value) {
    _$songNameAtom.reportWrite(value, super.songName, () {
      super.songName = value;
    });
  }

  final _$flipAtom = Atom(name: '_PlayerStore.flip');

  @override
  VoidCallback get flip {
    _$flipAtom.reportRead();
    return super.flip;
  }

  @override
  set flip(VoidCallback value) {
    _$flipAtom.reportWrite(value, super.flip, () {
      super.flip = value;
    });
  }

  final _$_PlayerStoreActionController = ActionController(name: '_PlayerStore');

  @override
  void setImage(String address) {
    final _$actionInfo = _$_PlayerStoreActionController.startAction(
        name: '_PlayerStore.setImage');
    try {
      return super.setImage(address);
    } finally {
      _$_PlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String name) {
    final _$actionInfo = _$_PlayerStoreActionController.startAction(
        name: '_PlayerStore.setName');
    try {
      return super.setName(name);
    } finally {
      _$_PlayerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageAdress: ${imageAdress},
songName: ${songName},
flip: ${flip}
    ''';
  }
}
