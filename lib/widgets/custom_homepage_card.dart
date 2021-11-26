import 'package:flutter/material.dart';

import '../consts.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imgAddress,
  }) : super(key: key);
  final String title;
  final String description;
  final String imgAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 3.8,
        child: LayoutBuilder(
            builder: (context, constraints) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              title,
                              style: TextStyle(color: kGreenDark, fontSize: 27),
                            ),
                            Text(
                              description,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: constraints.maxWidth / 2.3,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: kGreenDark,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "watch now",
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Icon(Icons.play_circle_fill)
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    Image.asset(imgAddress)
                  ],
                )));
  }
}
