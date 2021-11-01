import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  // ignore: non_constant_identifier_names
  var currentIndex_ = 0;
  var morningStar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Coming Soon!',
            style: TextStyle(
              fontFamily: 'Caviar Dreams',
              fontSize: 28,
              color: const Color(0xff080c17),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
