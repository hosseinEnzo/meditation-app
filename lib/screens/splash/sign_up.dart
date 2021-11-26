import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation/controller/splash_controller.dart';
import 'package:meditation/controller/form_controller.dart';
import 'package:meditation/utils/locator.dart';
import 'package:meditation/utils/show_snack_bar.dart';
import 'package:meditation/widgets/most_used_btn.dart';

import '../main_pages/main_home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late SplashController _splashController;
  late FormController _formController;

  @override
  void initState() {
    // TODO: implement initState
    _splashController = locator<SplashController>();
    _formController = Get.put(FormController());


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
                        child: Obx(
                          () => TextField(
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
                _formController.canRegister()
                    ? Get.off(const MainHomePage())
                    : Utils(context).showSnackBar(
                        "please fill all field's correctly",
                        Icons.warning,
                        Colors.amber);
              },
              richText: "Have an account ?",
              richText2: "Login",
              buttonText: "Sign Up",
              titleFunc: () {

                _splashController.switchToLogin();
                _splashController.setLogin();
              },
            ),
          ),
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
        _formController.validateName(value);
        break;

      case (1):
        _formController.validateEmail(value);
        break;

      case (2):
        _formController.validatePassword(value);
        break;
    }
  }

  String errorText(int number) {
    switch (number) {
      case (0):
        return _formController.nameError.value;

      case (1):
        return _formController.emailError.value;

      case (2):
        return _formController.passError.value;

      default:
        return "";
    }
  }
}
