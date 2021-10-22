import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store{

  @observable
  int currentIndex =0;

  @action
  void updateIndex(int value){
    currentIndex =value;
  }


}