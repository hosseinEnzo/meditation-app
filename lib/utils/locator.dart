import 'package:get_it/get_it.dart';
import 'package:meditation/controller/controller_store.dart';
import 'package:meditation/controller/form_store.dart';
import 'package:meditation/controller/home_controller.dart';
import 'package:meditation/controller/player_controller.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ControllerStore());
  locator.registerFactory(() => FormStore());
  locator.registerLazySingleton(() => HomeController());
  locator.registerLazySingleton(() => PlayerStore());

}
