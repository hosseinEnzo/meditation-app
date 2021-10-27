import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobx/mobx.dart';

part 'player_controller.g.dart';

class PlayerController = _PlayerController with _$PlayerController;

abstract class _PlayerController with Store {
  @observable
  var player = AudioPlayer();

  @observable
  Duration? duration;



  @action
  Future<void> setDuration() async {
    duration = await player.setAsset('assets/audio/song.mp3');
  }

  @observable
  String imageAdress = "";

  @observable
  bool isPlaying = false;

  @observable
  String songName = "";

  @action
  void setImage(String address) {
    imageAdress = address;
  }

  @action
  void playPause() {
    isPlaying ? player.pause() : player.play();
    isPlaying = !isPlaying;
  }

  @action
  void seekTo(Duration duration) {
    player.seek(duration);
  }

  @action
  void setName(String name) {
    songName = name;
  }

  @computed
  Duration get position =>player.position;
}
