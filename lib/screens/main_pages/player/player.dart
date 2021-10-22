import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meditation/consts.dart';
import 'package:meditation/controller/player_controller.dart';
import 'package:meditation/utils/locator.dart';
import 'package:meditation/widgets/wave_bar.dart';

class Player extends StatefulWidget {
  const Player({
    Key? key,
  }) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late PlayerStore _playerStore;

  @override
  void initState() {
    // TODO: implement initState
    _playerStore = locator<PlayerStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 120,
                backgroundImage: AssetImage(_playerStore.imageAdress),
              ),
            ),
            Column(
              children: [
                Text(
                  _playerStore.songName,
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
                child: Slider(
                  value: 12,
                  max: 50,
                  onChanged: (value) => print(value),
                  activeColor: kGreenLight,
                  thumbColor: kGreenLight,
                )),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(5, (index) => Icon(icon(index),color: Colors.white,size:index==2?100: 33,))),
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

    case (2):
      return Icons.pause_circle_filled;
    case (3):
      return Icons.skip_next_rounded;
    case (4):
      return Icons.repeat;

    default:
      return Icons.close;
  }
}
