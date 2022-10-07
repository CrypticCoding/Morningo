import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:morningo/Pages/SetupPage.dart';

import 'package:morningo/Pages/Splash_Screen.dart';
import 'package:morningo/Pages/Startup/welcome_page.dart';
// import 'package:morningo/Pages/Startup/morning_habits.dart';
// import 'package:morningo/Pages/Startup/why_bring.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//this is veer
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Caviar Dreams'), // Inter
      home: AppSplashScreen(), // ApplashScreen, NavigationController
    ),
  );
}
