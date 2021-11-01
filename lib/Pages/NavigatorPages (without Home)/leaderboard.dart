import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
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
