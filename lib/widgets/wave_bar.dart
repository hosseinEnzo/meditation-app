import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meditation/consts.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WaveBar extends StatelessWidget {
  WaveBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: WaveWidget(

        config: CustomConfig(
          gradients: [
            [kGreenLight,kGreenDark ],
            [kGreenLight, kGreenDark],
            [kGreenLight, kGreenDark],
            [kGreenLight,  kGreenDark]
          ],
          durations: [35000, 19440, 10800, 6000],
          heightPercentages: [0.20, 0.23, 0.25, 0.30],
          blur: const MaskFilter.blur(BlurStyle.solid, 10),
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
        ),
        duration: 32000,
        waveAmplitude: 0,
        heightPercentange: 0.3,
        size: const Size(
          double.infinity,
          double.infinity,
        ),
      ),
    );
  }
}
