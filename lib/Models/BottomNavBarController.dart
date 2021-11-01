import 'package:flutter/material.dart';
import 'package:morningo/Pages/HomePage.dart';
import 'package:morningo/Pages/NavigatorPages%20(without%20Home)/SettingsPage.dart';
import 'package:morningo/Pages/NavigatorPages%20(without%20Home)/courses.dart';
import 'package:morningo/Pages/NavigatorPages%20(without%20Home)/leaderboard.dart';

// ignore: must_be_immutable
class BottomNavController extends StatefulWidget {
  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  // ignore: non_constant_identifier_names
  var currentIndex_ = 1;
  List<Widget> screens = [
    CoursesPage(),
    HomePage(),
    LeaderboardPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,

      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(28),
            topLeft: Radius.circular(28),
          ),
          child: SizedBox(
            height: 100,
            child: BottomNavigationBar(
              currentIndex: currentIndex_,
              enableFeedback: true,
              unselectedItemColor: const Color(0xffdbdbdb),
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.school), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.public), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
              ],
              selectedItemColor: Color(0xffb0a4fb),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              onTap: (index) {
                setState(() {
                  currentIndex_ = index;
                  print(currentIndex_);
                });
              },
            ),
          ),
        ),
      ),
      extendBody: false,
      body: screens[currentIndex_],
    );
  }
}
