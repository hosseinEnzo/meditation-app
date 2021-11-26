import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:meditation/consts.dart';
import 'package:meditation/controller/player_controller.dart';

import 'package:meditation/widgets/wave_bar.dart';
import 'package:flutter_neumorphic_null_safety/flutter_neumorphic.dart';

class Player extends StatefulWidget {
  const Player({
    Key? key,
  }) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> with TickerProviderStateMixin {
  late PlayerController _playerController;
  late final AnimationController _animationController;
  late final AnimationController _animatedIconController;

  @override
  void initState() {
    // TODO: implement initState
    _playerController = Get.put(PlayerController());
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _animatedIconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("wew"+_playerController.position.inSeconds.toDouble().toString());
    print(_playerController.position.obs.value);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 120,
                backgroundImage:
                    AssetImage(_playerController.imageAdress.value),
              ),
            ),
            Column(
              children: [
                Text(
                  _playerController.songName.value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "By: Painting with Passion",
                  style: TextStyle(color: Colors.white70, fontSize: 25),
                )
              ],
            ),
            SliderTheme(
                data: const SliderThemeData(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7)),
                child:  Obx(
                    ()=>Slider(

                        value: _playerController.position.value.toDouble(),
                        min: 0.0,
                        max:
                            _playerController.duration.value.inSeconds.toDouble(),
                        onChanged: (value) {
                          print("siso");
                          print(value);
                          _playerController
                            .seekTo(Duration(seconds: value.toInt()));},
                        activeColor: kGreenLight,
                        thumbColor: kGreenLight,
                      ),
                )),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
              Duration(seconds: _playerController.position.value).toString().split('.')[0]
                   ,
                    style: const TextStyle(color: Colors.grey,fontSize: 25),
                  ),
                  Text(
                      Duration(seconds: _playerController.duration.value.inSeconds).toString().split('.')[0],
                    style: const TextStyle(color: Colors.grey,fontSize: 25),
                  )
                ],
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    5,
                    (index) => index == 2
                        ? NeumorphicButton(
                            onPressed: () {
                              _playerController.isPlaying.value
                                  ? _animatedIconController.forward()
                                  : _animatedIconController.reverse();
                              print(_playerController.isPlaying);
                              _playerController.playPause();
                            },
                            style: NeumorphicStyle(
                              boxShape: const NeumorphicBoxShape.circle(),
                              intensity: 0.3,
                              color: kGreenLight,
                              depth: -20,
                            ),
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kGreenDark,
                              ),
                              alignment: Alignment.center,
                              child: AnimatedIcon(
                                icon: AnimatedIcons.pause_play,
                                progress: _animatedIconController,
                                color: kGreenLight,
                                size: 50,
                              ),
                            ),
                          )
                        : Icon(
                            icon(index),
                            color: Colors.white,
                            size: index == 2 ? 100 : 33,
                          ))),
            WaveBar(),
          ],
        ),
      ),
    );
  }
}

IconData icon(int index) {
  switch (index) {
    case (0):
      return Icons.shuffle;
    case (1):
      return Icons.skip_previous_rounded;

    case (3):
      return Icons.skip_next_rounded;
    case (4):
      return Icons.repeat;

    default:
      return Icons.close;
  }
}
