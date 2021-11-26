import 'package:flutter/material.dart';
import 'package:meditation/controller/splash_controller.dart';
import 'package:meditation/controller/form_controller.dart';
import 'package:meditation/utils/locator.dart';
import 'package:meditation/widgets/most_used_btn.dart';
import '../../utils/show_snack_bar.dart';
import '../../main.dart';
import '../main_pages/main_home_page.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late SplashController _splashController;
  late FormController _formController;

  @override
  void initState() {
    // TODO: implement initState

    _splashController = locator<SplashController>();
    _formController =Get.put(FormController());

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
            "Sign In",
            style: TextStyle(
                fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Column(
            children: List.generate(
                2,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.white70))),
                        child: Obx(
                          () => TextField(
                            onChanged: (value) => index == 0
                                ? _formController.validateEmail(value)
                                : _formController.validatePassword(value),
                            style: const TextStyle(color: Colors.white),
                            obscureText: index == 1 ? true : false,
                            cursorColor: Colors.green,
                            decoration: InputDecoration(
                                errorText: index == 0
                                    ? _formController.emailError.value
                                    : _formController.passError.value,
                                border: InputBorder.none,
                                hintText: index == 0 ? "Email" : "Password",
                                hintStyle:
                                    const TextStyle(color: Colors.white70)),
                          ),
                        ),
                      ),
                    )),
          ),
          Center(
            child:
               MostUsedBtn(
                size: size,
                function: () {
                  print("loginh");
                  _formController.canLogin()
                      ? Get.off(const MainHomePage(),
                          )
                      : Utils(context).showSnackBar(
                          "please fill all field's correctly",
                          Icons.warning,
                          Colors.amber);
                },
                richText: "Don’t have an account",
                richText2: "Sign Up",
                buttonText: "login",
                titleFunc: () {
                  _splashController.switchToRegister();

                  _splashController.setRegister();
                },
              ),
            ),

        ],
      ),
    );
  }
}
