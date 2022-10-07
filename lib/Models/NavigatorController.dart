import 'package:flutter/material.dart';
import 'package:morningo/Models/BottomNavBarController.dart';
import 'package:morningo/Models/infoGathering.dart';
import 'package:morningo/Pages/ActivitiesPages/RunPage.dart';
import 'package:morningo/Pages/HomePage.dart';
import 'package:morningo/Pages/Startup/welcome_page.dart';
// import 'package:morningo/Pages/HomePageAbsoluteNew.dart';

import 'package:shared_preferences/shared_preferences.dart';

//import 'package:morningo/Pages/HomePage.dart';

// -- End--
import 'package:morningo/Pages/NavigatorPages%20(without%20Home)/SettingsPage.dart';
import 'package:morningo/Pages/SetupPage.dart';
import 'package:morningo/Pages/SignInPage.dart';
import 'package:morningo/Pages/Splash_Screen.dart';

// Activities Page
import 'package:morningo/Pages/ActivitiesPages/MeditationPage.dart';
import 'package:morningo/Pages/ActivitiesPages/PlanningPage.dart';
import 'package:morningo/Pages/ActivitiesPages/JournalPage.dart';
import 'package:morningo/Pages/ActivitiesPages/ExercisePageOld.dart';

// Navigator Pages
bool isFirstLaunched = false;

class NavigatorController extends StatefulWidget {
  @override
  _NavigatorControllerState createState() => _NavigatorControllerState();

  bool getIsFirstTimeLaunched() {
    return isFirstLaunched;
  }
}

String collection = "";

class _NavigatorControllerState extends State<NavigatorController> {
  BuildContext buildContext;

  bool test = false;
  String initialRouteVar = '/';

  void clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    collection = "";
  }

  @override
  void initState() {
    super.initState();

    setFirstlaunch();
    setState(() {});
  }

  void setFirstlaunch() async {
    isFirstLaunched =
        await InitialNavigationHandler().getFirstLaunch() ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    setState(() {}); // Try Removing it
    return MaterialApp(
      key: UniqueKey(),
      routes: {
        '/': (context) =>
            BottomNavController(), // HomePage, Instead goto  BottomBarPage
        '/splash': (context) => AppSplashScreen(),
        '/setup': (context) => SetupPage(),
        '/sign_in': (context) => SignInPage(),
        '/onboard': (context) => WelcomeScreen(),

        // Activities Page
        '/Meditate': (context) => MeditationPage(),
        '/Exercise': (context) => ExcercisePageOld(),
        '/Plan': (context) => PlanningPage(),
        '/Journal': (context) => JournalPage(),
        '/Run': (context) => RunPage(),
        // // Navigator Page
        // '/courses': (context) => CoursesPage(),
        // '/leaderboard': (context) => LeaderboardPage(),
        // '/settings': (context) => SettingsPage(),
      },
      initialRoute: isFirstLaunched
          ? '/'
          : '/onboard', // isFirstLaunched ? '/' : '/onboard' (THIS ONE IS THE RIGHT ONE!)
    );
  }
}

class InitialNavigationHandler {
  Future<String> getCollection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    collection = await prefs.getString("@collectionName").toString();
    // print(collection.toString());
    return collection;
  }

  Future<bool> getFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    bool firstLaunch = await prefs.getBool("@firstLaunch");
    print(firstLaunch.toString());
    return firstLaunch;
  }
}

class TodoRouteController {
  void navigateHomeWithCollection(
      BuildContext context, InfoGateherer collection) async {
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) {
          // return HomePage(
          //   gateherer: collection,
          //   contextOf: context,
          // );
          return BottomNavController(
            gateherer: collection,
            contextOf: context,
          );
        },
      ),
    );
  }
}

// Create Splash Screen Over Here