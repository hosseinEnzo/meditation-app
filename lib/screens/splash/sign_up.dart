import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meditation/controller/controller_store.dart';
import 'package:meditation/controller/form_store.dart';
import 'package:meditation/utils/locator.dart';
import 'package:meditation/widgets/most_used_btn.dart';

import '../main_pages/main_home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late ControllerStore _controllerStore;
  late FormStore _formStore;

  @override
  void initState() {
    // TODO: implement initState
    _controllerStore = locator<ControllerStore>();
    _formStore = locator<FormStore>();
    _formStore.validateAll();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                3,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white70))),
                        child: Observer(
                          builder: (context) => TextField(
                            onChanged: (value) => onChanged(index, value),
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.green,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: label(index),
                                errorText: errorText(index),
                                hintStyle:
                                    const TextStyle(color: Colors.white70)),
                          ),
                        ),
                      ),
                    )),
          ),
          Center(
            child: MostUsedBtn(
              size: size,
              function: () {
                print("sign Up");
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  MainHomePage(),));
              },
              richText: "Have an account ?",
              richText2: "Login",
              buttonText: "Sign Up",
              titleFunc: () {
                _controllerStore.switchToLogin();
                _controllerStore.setLogin();
              },
            ),
          )
        ],
      ),
    );
  }

  String label(int number) {
    switch (number) {
      case (0):
        return "Name";

      case (1):
        return "Email Address";

      case (2):
        return "Password";

      default:
        return "error!";
    }
  }

  void onChanged(int number, String value) {
    switch (number) {
      case (0):
        _formStore.validateUsername(value);
        break;

      case (1):
        _formStore.validateEmail(value);
        break;

      case (2):
        _formStore.validatePassword(value);
        break;
    }
  }

  String errorText(int number) {
    switch (number) {
      case (0):
        return _formStore.error.username ?? "";

      case (1):
        return _formStore.error.email ?? "";

      case (2):
        return _formStore.error.password ?? "";

      default:
        return "";
    }
  }
}
