import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Mood extends StatelessWidget {
  Mood({Key? key,
    required this.icon,
    required this.function,
    this.isPNG = false})
      : super(key: key);

  String icon;

  Function function;

  //i define this property because some svg file was broken
  bool isPNG;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        !isPNG
            ? SvgPicture.asset(
          icon,
        )
            : Image.asset(icon),
      ],
    );
  }
}