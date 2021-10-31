import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:morningo/Models/NavigatorController.dart';

class AppSplashScreen extends StatefulWidget {
  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> {
  final Widget svg = SvgPicture.asset('Assets/Logo/Logo3.svg');

  // ignore: missing_return
  Widget logoImage() {
    // morningStar += 100;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        child: svg,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatorHome();
  }

  void _navigatorHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => NavigatorController()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: 5,
        child: Container(
          padding: EdgeInsets.all(40),
          width: 300,
          height: 300,
          child: logoImage(),
        ),
      ),
    );
  }
}
