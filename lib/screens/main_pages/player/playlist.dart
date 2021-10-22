import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:meditation/utils/animation.dart';
import 'package:meditation/widgets/song_widget.dart';

import '../../../consts.dart';

class PlayList extends StatelessWidget {
  const PlayList({
    Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AnimateIfVisibleWrapper(
              showItemInterval: const Duration(milliseconds: 230),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    for (int i = 0; i < songWidgets.length + 1; i++)
                      AnimateIfVisible(
                          key: Key('$i'),
                          builder: animationBuilder(
                              i == 0
                                  ? Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 250,
                                      child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                  "assets/images/Jungle.png")),
                                          LayoutBuilder(builder:
                                              (context, constraints) {
                                            return Container(
                                              margin: EdgeInsets.only(
                                                  left: constraints
                                                      .maxWidth /
                                                      6),
                                              width:
                                              constraints.maxWidth /
                                                  2,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  const Text(
                                                    "Relax Sounds",
                                                    style: TextStyle(
                                                        color:
                                                        Colors.white,
                                                        fontSize: 30,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                  const Text(
                                                      "Sometimes the most productive thing you can do is relax.",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold)),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  SizedBox(
                                                    width: constraints
                                                        .maxWidth /
                                                        2.5,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            primary: Colors
                                                                .white,
                                                            padding: const EdgeInsets
                                                                .symmetric(
                                                                vertical:
                                                                10),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    10))),
                                                        onPressed: () {},
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Text(
                                                              "Play now",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  19,
                                                                  color:
                                                                  kGreenDark,
                                                                  fontWeight:
                                                                  FontWeight.w600),
                                                            ),
                                                            const SizedBox(
                                                              width: 7,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .play_circle_fill,
                                                              color:
                                                              kGreenDark,
                                                            )
                                                          ],
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            );
                                          })
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              )
                                  : songWidgets[i - 1],
                              xOffset: -0.50))
                  ],
                ),
              ),
            )));
  }
}

const List<SongWidget> songWidgets = [
  SongWidget(
    imgAddress: "assets/images/Jungle.png",
    topTitle: "Painting Forest",
    middleTitle: "59899 Listening",
    duration: "20 Min",
  ),
  SongWidget(
    imgAddress: "assets/images/Sunshine3.png",
    topTitle: "Painting Forest",
    middleTitle: "59899 Listening",
    duration: "20 Min",
  ),
  SongWidget(
    imgAddress: "assets/images/Sunshine1.png",
    topTitle: "Painting Forest",
    middleTitle: "59899 Listening",
    duration: "20 Min",
  ),
  SongWidget(
    imgAddress: "assets/images/Sunshine2.png",
    topTitle: "Painting Forest",
    middleTitle: "59899 Listening",
    duration: "20 Min",
  ),
  SongWidget(
    imgAddress: "assets/images/Jungle.png",
    topTitle: "Painting Forest",
    middleTitle: "59899 Listening",
    duration: "20 Min",
  ),
  SongWidget(
    imgAddress: "assets/images/Sunshine3.png",
    topTitle: "Painting Forest",
    middleTitle: "59899 Listening",
    duration: "20 Min",
  ),
  SongWidget(
    imgAddress: "assets/images/Sunshine1.png",
    topTitle: "Painting Forest",
    middleTitle: "59899 Listening",
    duration: "20 Min",
  ),
  SongWidget(
    imgAddress: "assets/images/Sunshine2.png",
    topTitle: "Painting Forest",
    middleTitle: "59899 Listening",
    duration: "20 Min",
  ),
  SongWidget(
    imgAddress: "assets/images/Jungle.png",
    topTitle: "Painting Forest",
    middleTitle: "59899 Listening",
    duration: "20 Min",
  ),
  SongWidget(
    imgAddress: "assets/images/Sunshine3.png",
    topTitle: "Painting Forest",
    middleTitle: "59899 Listening",
    duration: "20 Min",
  ),
  SongWidget(
    imgAddress: "assets/images/Sunshine1.png",
    topTitle: "Painting Forest",
    middleTitle: "59899 Listening",
    duration: "20 Min",
  ),
  SongWidget(
    imgAddress: "assets/images/Sunshine2.png",
    topTitle: "Painting Forest",
    middleTitle: "59899 Listening",
    duration: "20 Min",

  ),
];
