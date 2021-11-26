import 'package:get/get.dart';

class FormController extends GetxController {
  RxString emailError = "please enter valid email".obs;
  RxString passError = "please enter password more than 5 character".obs;
  RxString nameError = "please enter valid name".obs;

  void validateEmail(String email) {
    if (email.isEmail) {
      emailError.value ="";
    } else {
      emailError.value = "please enter valid email";
    }
  }

  void validatePassword(String pass) {
    if (pass.length > 5) {
       passError.value ="";
    } else {
      passError.value = "please enter password more than 5 character";
    }
  }

  void validateName(String name) {
    if (name.isNotEmpty) {
      nameError.value ="";
    } else {
      nameError.value = "please enter valid name";
    }
  }

  bool canLogin() {
    if (emailError.value == "" && passError.value == "") {
      return true;
    } else {
      return false;
    }
  }

  bool canRegister() {
    if (emailError.value == "" &&
        passError.value == "" &&
        nameError.value == "") {
      return true;
    } else {
      return false;
    }
  }
}
