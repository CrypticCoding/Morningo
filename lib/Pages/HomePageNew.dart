import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:shared_preferences/shared_preferences.dart';

// Models / Utils
import '../Models/Time_N_Date.dart';
import '../Models/MoodState.dart';
import '../Models/globalHandler.dart';
import '../Models/infoGathering.dart';

// components
import '../components/todoGenerator.dart';

// Variables Important:

// nameOfUser
// morningStar
//  '$hour : $min $clock',
//_showMoodPanel(/context, good, neutral, bad);

class MyNewApp extends StatefulWidget {
  @override
  _MyNewAppState createState() => _MyNewAppState();
}

class _MyNewAppState extends State<MyNewApp> {
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
    );
  }
}

// ignore: must_be_immutable
class Home extends StatefulWidget {
  InfoGateherer? gateherer;
  // New
  BuildContext? contextOf;

  Home({
    Key? key,
    this.gateherer,
    this.contextOf,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool good = false;
  bool neutral = false;
  bool bad = false;

  var hour = 0;
  var min = 0;
  var clock = "AM";
  // ignore: non_constant_identifier_names
  var currentIndex_ = 1;
  int? morningStar = 0;

  // WIDTH

  Time time = Time();
  String globalTime = "";

  MoodState? moodState;
  // DateTime dateTime;
  GlobalHandler handler = GlobalHandler();
  String? nameOfUser;

  // ignore: non_constant_identifier_names
  final Widget no_activities_svg = SvgPicture.asset(
      'Assets/SVG/undraw_Faq_re_31cw.svg',
      semanticsLabel: 'Acme Logo');

  // ignore: non_constant_identifier_names
  @override
  void initState() {
    super.initState();

    GlobalMorningStarHandler().intialMorningStar(10);

    setupMorningStars();
    setupCollections();
    // GlobalMorningStarHandler().setGlobalMorningStarConstant(100);
    setupTime(context);
  }

  void clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void setupCollections() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString("@collectionName");
    nameOfUser = userName.toString();
    setState(() {});
  }

  void setupTime(context) async {
    // ignore: non_constant_identifier_names
    var time_ = await time.GetTime();
    hour = int.parse(time_.split(':')[0]);
    min = int.parse(time_.split(':')[1]);
    clock = time_.split(':')[2];
    setState(() {});
  }

  void setupMorningStars() async {
    // ignore: await_only_futures
    GlobalMorningStarHandler().getMorningStar().then((value) {
      if (morningStar == null) morningStar = 0;
      morningStar = value;
    });
    print(morningStar);
    if (morningStar == null || morningStar == 0) {
      GlobalMorningStarHandler().setMorningStar(0);
    } else {
      GlobalMorningStarHandler().setMorningStar(morningStar);
    }
    print("Morning Star Amount: $morningStar");
    // Need to check some other way that it came from somewhere else
    setState(() {});
  }

  // ignore: missing_return
  Widget clearAllActivities() {
    // morningStar += 100;
    return Container(
      width: 300,
      height: 300,
      margin: EdgeInsets.only(top: 40, left: 40),
      child: no_activities_svg,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Done Command
    void doneCommand(BuildContext context) {
      Navigator.of(context).pop();
      if (moodState == null) return;
      setState(() {
        TodoGen().generateTodo();

        if (moodState!.good == true) {
          String initialTime = time.habitTimeSetter(20);
          String initialTimeRefined = initialTime.split(" ")[0];
          hour = int.parse(initialTimeRefined.split(':')[0]);
          min = int.parse(initialTimeRefined.split(':')[1]);
          clock = initialTime.split(" ")[1];
          globalTime = "$hour:$min:$clock";
          handler.setTime(globalTime);
        }
        if (moodState!.neutral == true) {
          String initialTime = time.moodNeutral(20);
          String initialTimeRefined = initialTime.split(" ")[0];
          hour = int.parse(initialTimeRefined.split(':')[0]);
          min = int.parse(initialTimeRefined.split(':')[1]);
          clock = initialTime.split(" ")[1];
          globalTime = "$hour:$min:$clock";
          handler.setTime(globalTime);
        }
        if (moodState!.bad == true) {
          // Change the algorithm
          String initialTime = time.moodBad(30);
          String initialTimeRefined = initialTime.split(" ")[0];
          hour = int.parse(initialTimeRefined.split(':')[0]);
          min = int.parse(initialTimeRefined.split(':')[1]);
          clock = initialTime.split(" ")[1];
          globalTime = "$hour:$min:$clock";
          handler.setTime(globalTime);
        }

        setState(() {});
      });
    }

    void _showMoodPanel(
        BuildContext context, bool goodMood, bool neutralMood, bool badMood) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "How Was Your Mood",
                        textScaleFactor: 1.8,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            good = !good;
                            neutral = false;
                            bad = false;
                            moodState = MoodState(good, neutral, bad);
                            Navigator.of(context).pop();
                            _showMoodPanel(context, good, neutral, bad);
                          },
                          child: Column(
                            children: [
                              Text(
                                "😍",
                                style: TextStyle(fontSize: 40),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Good")
                            ],
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: good ? Border.all(color: Colors.blue) : null,
                        ),
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            good = false;
                            neutral = !neutral;
                            bad = false;
                            moodState = MoodState(good, neutral, bad);
                            Navigator.of(context).pop();
                            _showMoodPanel(context, good, neutral, bad);
                          },
                          child: Column(
                            children: [
                              Text(
                                "😀",
                                style: TextStyle(fontSize: 40),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Neutral")
                            ],
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: neutral
                                ? Border.all(color: Colors.blue)
                                : null),
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            good = false;
                            neutral = false;
                            bad = !bad;
                            moodState = MoodState(good, neutral, bad);
                            Navigator.of(context).pop();
                            _showMoodPanel(context, good, neutral, bad);
                          },
                          child: Column(
                            children: [
                              Text(
                                "😒",
                                style: TextStyle(fontSize: 40),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Bad")
                            ],
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border:
                                bad ? Border.all(color: Colors.blue) : null),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: InkWell(
                      splashColor: Colors.amber,
                      //radius: ,
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.purple,
                        ),
                        //margin: EdgeInsets.all(35),
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Text(
                          "Done",
                          textScaleFactor: 1.4,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        doneCommand(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffe8e4e4),
        // Body Matters!
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24)),
                  color: const Color(0xff755fda),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, left: 7),
                child: Text(
                  'Hi, $nameOfUser!',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 40,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 130, left: 7),
                child: Text(
                  'Morning Star: $morningStar!',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 30,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              // Shape
              Container(
                width: 200,
                height: 200,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(right: 300, bottom: 100),
                child: BlendMask(
                  blendMode: BlendMode.softLight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                      border: Border.all(
                          width: 43.0, color: const Color(0xff876bde)),
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 90, left: 10),
                child: Text(
                  'what\'s your wake up time?',
                  style: TextStyle(
                    fontFamily: 'Apercu',
                    fontSize: 18,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // Image
              Container(
                width: 78,
                height: 78,
                margin: EdgeInsets.only(left: 300, top: 40),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23.0),
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 373,
                    height: 54,
                    margin: EdgeInsets.only(top: 195),
                    child: Container(
                      // This One!
                      child: Container(
                        // padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(left: 20, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$hour : $min $clock',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: const Color(0xff7e7e7e),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                splashColor: Colors.black,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  child: IconButton(
                                    color: Colors.grey,
                                    icon: Icon(Icons.done),
                                    onPressed: () {
                                      // print("DAMN!");
                                      // Changed to wiget.contextOf
                                      _showMoodPanel(
                                          context, good, neutral, bad);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.0),
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 270, left: 15),
                child: Text(
                  'Activities',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: const Color(0xff6d6d6d),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // Tasks Generator
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Scrollbar(
                      child: Container(
                        margin: EdgeInsets.only(top: 290),
                        child: TodoController().getAllTodoLenght() == 0
                            ? clearAllActivities()
                            : TodoGenerator(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
