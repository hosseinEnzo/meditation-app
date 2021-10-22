import 'package:get_storage/get_storage.dart';

class Storage{
  final box =GetStorage();
  void setLogin(){
    box.write("page", "login");
  }
  void setRegister(){
    box.write("page", "register");
  }
}

