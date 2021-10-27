import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meditation/controller/player_controller.dart';
import 'package:meditation/screens/main_pages/player/player.dart';
import 'package:meditation/utils/locator.dart';

class SongWidget extends StatefulWidget {
  const SongWidget({
    required this.imgAddress,
    required this.topTitle,
    required this.middleTitle,
    required this.duration,

    Key? key,
  }) : super(key: key);

  final String imgAddress;
  final String topTitle;
  final String middleTitle;
  final String duration;

  @override
  State<SongWidget> createState() => _SongWidgetState();
}

class _SongWidgetState extends State<SongWidget> {
  late PlayerController _playerController;

  @override
  void initState() {
    // TODO: implement initState
    _playerController = locator<PlayerController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child:
      GestureDetector(
        onTap: () {
          _playerController.setImage(widget.imgAddress);
          _playerController.setName(widget.topTitle);
          Navigator.push(context, CupertinoPageRoute(builder:  (context) => const Player(),));

        },
        child: SizedBox(
          width: double.infinity,
          height: 85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(widget.imgAddress),
                      fit: BoxFit.cover),
                ),
                width: 80,
                height: 90,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.topTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.middleTitle,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
              Text(
                widget.duration,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ),
      ),

    );
  }
}
