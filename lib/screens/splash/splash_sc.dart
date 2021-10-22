import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meditation/controller/controller_store.dart';
import 'package:meditation/screens/splash/login_register.dart';
import 'package:meditation/utils/locator.dart';
import 'package:meditation/utils/storage.dart';
import 'package:meditation/widgets/most_used_btn.dart';

import '../../consts.dart';
class SplashSc extends StatefulWidget {
  const SplashSc({Key? key}) : super(key: key);

  @override
  State<SplashSc> createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> with TickerProviderStateMixin {
  bool iconShouldUp = false;
  final Storage _storage =Storage();


  late AnimationController _controller;
  late Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  late ControllerStore _controllerStore;

  late Timer _timer;

  int _start = 1;

  void _startTimer() {
    const onsec = Duration(seconds: 1);
    _timer = Timer.periodic(onsec, (timer) {
      if (_start == 0) {
        setState(() {
          iconShouldUp = true;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    _controllerStore = locator<ControllerStore>();
    _storage.setLogin();

    _startTimer();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
    // _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    print(_animation);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
              height: size.height,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                    sigmaX: iconShouldUp ? 5 : 0, sigmaY: iconShouldUp ? 5 : 0),
                child: Image.asset(kSplashPic,
                    fit: BoxFit.fitHeight),
              )),
          AnimatedPositioned(
            top: iconShouldUp ? 100 : 250,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: SizedBox(
              height: 200,
              child: kSplashLogo,
            ),
          ),
          _animation.value < 1.0
              ? Container()
              : Positioned(
                  bottom: 140,
                  left: 0,
                  right: 0,
                  child: FadeTransition(
                      opacity: _animation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WELCOME",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Do meditation. Stay focused.Live a healthy life",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          MostUsedBtn(
                            size: size,
                            function: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginRegister(),
                                  ));
                              print("loginh");
                            },
                            richText: "Don't have an account ?",
                            richText2: "Sign up",
                            buttonText: "Login With Email",
                            titleFunc: () {
                              _controllerStore.setRegister();
                              _storage.setRegister();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginRegister(),
                                  ));
                            },
                          )
                        ],
                      )),
                ),
        ],
      ),
    );
  }
}
