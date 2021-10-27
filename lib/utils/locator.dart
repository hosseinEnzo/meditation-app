import 'package:get_it/get_it.dart';
import 'package:meditation/controller/splash_controller.dart';
import 'package:meditation/controller/form_controller.dart';
import 'package:meditation/controller/home_controller.dart';
import 'package:meditation/controller/player_controller.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SplashController());
  locator.registerFactory(() => FormController());
  locator.registerLazySingleton(() => HomeController());
  locator.registerLazySingleton(() => PlayerController());

}
