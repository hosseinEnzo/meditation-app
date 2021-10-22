import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meditation/controller/controller_store.dart';
import 'package:meditation/controller/form_store.dart';
import 'package:meditation/utils/locator.dart';
import 'package:meditation/widgets/most_used_btn.dart';

import '../main.dart';
import 'main_pages/main_home_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                        child: Observer(
                          builder: (context) => TextField(


                            onChanged: (value) => index == 0
                                ? _formStore.validateEmail(value)
                                : _formStore.validatePassword(value) ,
                            style: const TextStyle(color: Colors.white),

                            obscureText: index==1?true:false,
                            cursorColor: Colors.green,
                            decoration: InputDecoration(
                                errorText: index == 0
                                    ? _formStore.error.email
                                    : _formStore.error.password,
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
            child: MostUsedBtn(
              size: size,
              function: () {
                print("loginh");
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  MainHomePage(),));
              },
              richText: "Don’t have an account",
              richText2: "Sign Up",
              buttonText: "login",
              titleFunc: () {
                _controllerStore.switchToRegister();

                _controllerStore.setRegister();
              },
            ),
          )
        ],
      ),
    );
  }
}
