import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation/controller/controller_store.dart';
import 'package:meditation/screens/splash/sign_up.dart';
import 'package:meditation/utils/locator.dart';
import 'package:meditation/utils/storage.dart';
import 'package:meditation/widgets/most_used_btn.dart';

import '../../consts.dart';
import 'login.dart';

final box = GetStorage();

class LoginRegister extends StatefulWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  late ControllerStore _controllerStore;

  List<Widget> pages = const [Login(), SignUp()];
  Storage storage = Storage();

  void selectPage() async {
    String page = box.read("page");

    if (page == "register") {
      await Future.delayed(const Duration(milliseconds: 500), () {
        _controllerStore.pageController.nextPage(
            duration: const Duration(seconds: 1), curve: Curves.bounceOut);
      });
      storage.setRegister();
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    _controllerStore = locator<ControllerStore>();
    selectPage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsClose =MediaQuery.of(context).viewInsets.bottom ==0;


    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: keyboardIsClose?true:false,
          child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.9,
              child: Lottie.asset("assets/animation/meditation.json")),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 20, right: 20),
            child: Observer(
              builder: (context) => PageView.builder(
                controller: _controllerStore.pageController,

                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
