import 'package:mobx/mobx.dart';
import 'package:validators2/validators.dart';

part 'form_controller.g.dart';

// class CustomColor extends Color {
//   CustomColor(int value) : super(value);
// }

class FormController = _FormController with _$FormController;

abstract class _FormController with Store {
  final FormErrorState error = FormErrorState();

  // @observable
  // CustomColor color = CustomColor(0);

  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  ObservableFuture<bool> usernameCheck = ObservableFuture.value(true);



  @computed
  bool get canLogin => !error.hasErrorLogin;

  @computed
  bool get canRegister => !error.hasErrorRegister;

  @observable
  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => name, validateUsername),
    ];
  }



  @action
  void validateEmail(String value) {
    error.email = isEmail(value.trim()) ? null : 'Not a valid email';
  }

  @action
  void validatePassword(String value) {
    error.password = null;
    if (isNull(value) || value.trim().isEmpty) {
      error.password = 'Cannot be blank';
      return;
    }
    if (!isLength(value.trim(), 5)) error.password = 'Must be at least 5 characters ';
  }

  @action
  Future validateUsername(String value) async {
    error.username = null;

    if (isNull(value) || value.trim().isEmpty) {
      error.username = 'Cannot be blank';
      return;
    }

    try {
      usernameCheck = ObservableFuture(checkValidUsername(value));

      final isValid = await usernameCheck;
      if (!isValid) {
        error.username = 'Username cannot be "admin"';
        return;
      }
    } on Object catch (_) {
      error.username = 'Server validation is broken';
    }
  }

  Future<bool> checkValidUsername(String value) async {
    await Future.delayed(const Duration(seconds: 1));
    return value != 'admin';
  }

  Future<bool> validateAll() async {
    await validateUsername(name);
    validateEmail(email);
    validatePassword(password);
    return canLogin;
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String? username;

  @observable
  String? email;

  @observable
  String? password;

  @computed
  bool get hasErrorRegister => username != null || email != null || password != null;
  bool get hasErrorLogin =>  email != null || password != null;

}