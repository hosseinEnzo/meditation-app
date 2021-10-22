import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meditation/controller/controller_store.dart';
import 'package:meditation/screens/splash/login_register.dart';
import 'package:meditation/screens/splash/sign_up.dart';
import 'package:meditation/utils/locator.dart';

import '../consts.dart';

class MostUsedBtn extends StatefulWidget {
  MostUsedBtn(
      {Key? key,
      required this.size,
      required this.function,
      required this.titleFunc,
      required this.richText,
      required this.richText2,
      required this.buttonText})
      : super(key: key);

  String buttonText;
  String richText;
  String richText2;
  Function function;
  Function titleFunc;

  Size size;

  @override
  State<MostUsedBtn> createState() => _MostUsedBtnState();
}

class _MostUsedBtnState extends State<MostUsedBtn> {

  late ControllerStore _controllerStore;
  @override
  void initState() {
    // TODO: implement initState
    _controllerStore = locator<ControllerStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.size.height / 15),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
           ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: kGreen,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17))),
                onPressed: () => widget.function(),
                child: Text(
                  widget.buttonText,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )),

          const SizedBox(
            height: 18,
          ),

             GestureDetector(

              onTap: (){
                print("clicked");
                widget.titleFunc();
              },
              child: RichText(
                  text: TextSpan(
                      text: widget.richText,
                      style: const TextStyle(fontSize: 20),
                      children: <TextSpan>[
                    TextSpan(
                        text: widget.richText2,
                        style: const TextStyle(fontWeight: FontWeight.bold))
                  ])),
            ),

        ],
      ),
    );
  }
}
