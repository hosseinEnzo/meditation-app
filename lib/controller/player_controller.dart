import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'player_controller.g.dart';

class PlayerStore = _PlayerStore with _$PlayerStore;

abstract class _PlayerStore with Store {
  @observable
  String imageAdress = "";

  @observable
  String songName = "";

  @observable
  late VoidCallback flip;



  @action
  void setImage(String address) {
    imageAdress = address;
  }

  @action
  void setName(String name) {
    songName = name;
  }




}
