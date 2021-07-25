import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/material.dart';

// Models / Utils
import "../Models/Time.dart";
import '../Models/MoodState.dart';
import '../Models/globalHandler.dart';

// components
import '../components/todoGenerator.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var context;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key key,
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

  Time time = Time();
  String globalTime = "";

  MoodState moodState;
  // DateTime dateTime;
  GlobalHandler handler = GlobalHandler();
  // ignore: non_constant_identifier_names
  @override
  Future<void> initState() {
    super.initState();
    setupTime(context);
  }

  void setupTime(context) async {
    var time_ = await time.GetTime();
    hour = int.parse(time_.split(':')[0]);
    min = int.parse(time_.split(':')[1]);
    clock = time_.split(':')[2];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    void doneCommand(BuildContext context) {
      Navigator.of(context).pop();
      setState(() {
        // learn about time in flutter
        // Create A Function, Call The Function via A Machine Learning ALgo
        TodoGen().generateTodo();
        // done Command goes here
        if (moodState.good == true) {
          // Decrease  the time a little bit
          // if null then run below code, if not then read from global time
          String initialTime = time.habitTimeSetter(20);
          String initialTimeRefined = initialTime.split(" ")[0];
          hour = int.parse(initialTimeRefined.split(':')[0]);
          min = int.parse(initialTimeRefined.split(':')[1]);
          clock = initialTime.split(" ")[1];
          globalTime = "$hour:$min:$clock";
          handler.setTime(globalTime);
        }
        if (moodState.neutral == true) {
          // Change the algorithm a little amount
          String initialTime = time.moodNeutral(20);
          String initialTimeRefined = initialTime.split(" ")[0];
          hour = int.parse(initialTimeRefined.split(':')[0]);
          min = int.parse(initialTimeRefined.split(':')[1]);
          clock = initialTime.split(" ")[1];
          globalTime = "$hour:$min:$clock";
          handler.setTime(globalTime);
        }
        if (moodState.bad == true) {
          // Change the algorithm
          String initialTime = time.moodBad(30);
          String initialTimeRefined = initialTime.split(" ")[0];
          hour = int.parse(initialTimeRefined.split(':')[0]);
          min = int.parse(initialTimeRefined.split(':')[1]);
          clock = initialTime.split(" ")[1];
          globalTime = "$hour:$min:$clock";
          handler.setTime(globalTime);
        }
      });
    }

    void _showMoodPanel(
        BuildContext context, bool goodMood, bool neutralMood, bool badMood) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              decoration: BoxDecoration(
                color: Colors.black12,
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
                            child: Text("Good"),
                          ),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: good
                                  ? Border.all(color: Colors.blue)
                                  : null)),
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
                            child: Text("Neutral"),
                          ),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: neutral
                                  ? Border.all(color: Colors.blue)
                                  : null)),
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
                            child: Text("Bad"),
                          ),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border:
                                  bad ? Border.all(color: Colors.blue) : null)),
                    ],
                  ),
                  GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.purple,
                        ),
                        margin: EdgeInsets.all(35),
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Text(
                          "Done",
                          textScaleFactor: 1.4,
                        ),
                      ),
                      onTap: () {
                        doneCommand(context);
                      }),
                ],
              ),
            );
          });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffe8e4e4),
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                width: 428,
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
                  'Hi Jarif',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 40,
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
                            Container(
                              child: IconButton(
                                color: Colors.grey,
                                icon: Icon(Icons.done),
                                onPressed: () {
                                  _showMoodPanel(context, good, neutral, bad);
                                },
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
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Scrollbar(
                      child: Container(
                        margin: EdgeInsets.only(top: 290),
                        child: TodoController().getAllTodoLenght() == 0
                            ? Container(
                                margin: EdgeInsets.only(top: 120, left: 40),
                                child: Text(
                                  'No Activities Found',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 36,
                                    color: const Color(0xff707070),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              )
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
