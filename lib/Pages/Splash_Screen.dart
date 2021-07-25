import 'package:flutter/material.dart';
import 'package:morningo/Pages/HomePage.dart';
import 'package:splashscreen/splashscreen.dart';

class HomeSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(
        seconds: 5,
        navigateAfterSeconds: MyApp(),
        title: new Text('Welcome In SplashScreen'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red,
      ),
    );
  }
}
