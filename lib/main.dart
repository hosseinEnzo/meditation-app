import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meditation/consts.dart';
import 'package:meditation/screens/splash_sc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditation/utils/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  setupLocator();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
        textTheme: GoogleFonts.alegreyaTextTheme(),
        scaffoldBackgroundColor: kGreenDark),
    home: const SafeArea(child: SplashSc()),
  ));
}
