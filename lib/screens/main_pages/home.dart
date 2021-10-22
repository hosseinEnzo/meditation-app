import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation/consts.dart';
import 'package:meditation/utils/animation.dart';
import 'package:meditation/widgets/custom_homepage_card.dart';
import 'package:meditation/widgets/mood.dart';
import 'package:auto_animated/auto_animated.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static List<String> imageAddress = [
    "assets/images/Calm.svg",
    "assets/images/Relax.svg",
    "assets/images/Focus.svg",
    "assets/images/Anxious.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
          child: AnimateIfVisibleWrapper(
            showItemInterval: const Duration(milliseconds: 230),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  for (int i = 0; i < customCards.length + 1; i++)
                    AnimateIfVisible(
                        key: Key('$i'),
                        builder: animationBuilder(
                            i == 0
                                ? Column(
                                    children: [
                                      const Text(
                                        "Welcome back, Afreen!",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        "How are you feeling today ?",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 25,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: List.generate(
                                            imageAddress.length,
                                            (index) => Mood(
                                                icon: imageAddress[index],
                                                isPNG:
                                                    index == 3 ? true : false,
                                                function: () {})),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  )
                                : customCards[i - 1],
                            xOffset: -0.50))
                ],
              ),
            ),
          )),
    );
  }
}

const List<CustomCard> customCards = [
  CustomCard(
    title: "Meditation 101",
    description: "Techniques Benefits, and a Beginner’s How-To",
    imgAddress: "assets/images/Meditation.png",
  ),
  CustomCard(
    title: "Cardio Meditation",
    description: "Basics of Yoga for Beginners or Experienced Professionals",
    imgAddress: "assets/images/Cardio.png",
  ),
  CustomCard(
    title: "Meditation 101",
    description: "Techniques Benefits, and a Beginner’s How-To",
    imgAddress: "assets/images/Meditation.png",
  ),
  CustomCard(
    title: "Cardio Meditation",
    description: "Basics of Yoga for Beginners or Experienced Professionals",
    imgAddress: "assets/images/Cardio.png",
  ),
  CustomCard(
    title: "Meditation 101",
    description: "Techniques Benefits, and a Beginner’s How-To",
    imgAddress: "assets/images/Meditation.png",
  ),
  CustomCard(
    title: "Cardio Meditation",
    description: "Basics of Yoga for Beginners or Experienced Professionals",
    imgAddress: "assets/images/Cardio.png",
  )
];
