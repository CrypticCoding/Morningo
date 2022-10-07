import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morningo/Models/PageActivity.dart';
import 'package:morningo/Models/globalHandler.dart';
import 'package:morningo/components/todoGenerator.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

// TODO:
/*
1) Animated Text
2) Hold How Many Times He Have Completed The Damn Thing
3) Create A Graph and Show it to The Screen (Design & Development)
3) Graph show
5) Stop Button needs to have to be connected "SYNCING"
6) When you are completed, It will have A streaks How Many Times
7) Per day you wake up, give them streaks, if they wake up at the same time, you calculated
8) Per Day Calculation. 
*/

bool isEnded = false;
bool isMin = false;
bool isSec = false;
var isStarted = true;

class ExcercisePageOld extends StatefulWidget {
  @override
  _ExcercisePageOldState createState() => _ExcercisePageOldState();
}

class _ExcercisePageOldState extends State<ExcercisePageOld> {
  final Widget svg = SvgPicture.asset('Assets/SVG/exercise_guy.svg');

  Color backgroundColorPrimary = const Color(0xffb546d0);
  Color backgroundColorSecondary = const Color(0xff9a12c2);
  Color middleLineColor = const Color(0xffec4ce7);
  Color middleBoxColor = const Color(0xffc331eb);

  String excerciseBenefits =
      'Excreduces your risk of high blood pressure (hypertension),  boosts your mood and wellbeing.\n';

  String nameOfActivity = "Excercise";
  String nameOfActivitySubtitle = "Excercise for 10 mins";

  String activityName = "Exercise";

  final mins = 10;

  // ignore: avoid_init_to_null
  var streaks;
  final _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: 0,
    onChange: (value) {
      // print('onChange $value');
      // if (isMin && isSec && !isStarted) {
      //   streaks += 1;
      //   isMin = false;
      //   isSec = false;
      // }
    },
    onEnded: () {
      isEnded = true;
    },
    onChangeRawSecond: (value) {},
    onChangeRawMinute: (value) {},
  );
  void setupActivity(BuildContext context) async {
    // Print the streaks
    // Show it in the screen!
    String streaksString = await PageActivity().getActivity("@Exercise") ?? "";
    if (streaksString == "") {
      PageActivity().addActivity("@Exercise", 1);
      streaks = 1;
      setState(() {});
    }
    streaks = int.tryParse(streaksString) ?? 1;
    // print(streaks);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    isEnded = false;
    isMin = false;
    isSec = false;
    isStarted = true;
    // PageActivity().clearAll();
    // PageActivity().addActivity("Excercise", streaks);
    // setupActivity(context);
    // streaks = PageActivity().getActivity("@Excercise").toString();
    // streaks = 1.toString();
    setupActivity(context);
    _stopWatchTimer.rawTime.listen((value) {});
    _stopWatchTimer.minuteTime.listen((value) {});
    _stopWatchTimer.secondTime.listen((value) {});
    _stopWatchTimer.records.listen((value) {});
    // Set the value of Timer to 10 Mins
    _stopWatchTimer.setPresetSecondTime(mins);
    //_stopWatchTimer.setPresetMinuteTime(mins);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.topLeft,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1.0),
                end: Alignment(0.0, 1.0),
                colors: [backgroundColorPrimary, backgroundColorSecondary],
                stops: [0.0, 1.0],
              ),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 35, left: 350),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.table_rows,
                  color: Colors.white,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 210, left: 10),
            child: Text(
              'Day: $streaks',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 35, left: 350),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.table_rows,
                  color: Colors.white,
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 70),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                activityName,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 33,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 110, left: 10),
            child: Text(
              'duration: 10 minutes',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: const Color(0xffbebebe),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 70, left: 190),
            width: 217.19,
            height: 266.67,
            child: svg,
          ),
          Container(
            width: 170,
            height: 300,
            margin: EdgeInsets.only(top: 140, left: 10),
            child: Text(
              excerciseBenefits,
              style: TextStyle(
                fontFamily: 'Enigmatic Unicode',
                fontSize: 9,
                color: const Color(0xffffffff),
                letterSpacing: 2.349,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 491,
            height: 21,
            margin: EdgeInsets.only(top: 295),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: middleLineColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(top: 330, left: 30),
              child: Text(
                'Time',
                style: TextStyle(
                  fontFamily: 'Gotham',
                  fontSize: 27,
                  color: const Color(0xffffffff),
                  letterSpacing: 4.266,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  onPressed: () {
                    // TodoController().removeSpecificTodo(
                    //     "Excercise", "Excercise for 5 mins");
                    // setState(() {});
                    // Navigator.pop(context);
                    // if (isSec == true && isMin == true) {
                    //   print("DAMN!");
                    //   TodoController().removeSpecificTodo(
                    //       "Excercise", "Excercise for 5 mins");
                    //   setState(() {});
                    //   Navigator.pop(context);
                    // }
                    if (isEnded) {
                      TodoController().removeSpecificTodo(
                          nameOfActivity, nameOfActivitySubtitle, svg, 0);
                      setState(() {});
                      Navigator.pushNamed(context, '/')
                          .then((value) => setState(() {}));
                      setState(() {});
                      streaks += 1;
                      // _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                      PageActivity().setActivity("@Exercise", streaks);
                      GlobalMorningStarHandler().callMorningStar(context);
                      isEnded = false;
                    }
                    if (isStarted == true) {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                    } else if (isStarted == false && isEnded == false) {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                    }
                    isStarted = !isStarted;
                    setState(() {});
                  },

                  color: isEnded == false
                      ? const Color(0xff1e0e33)
                      : const Color(0xff31eb50),
                  // color: isEnded : const Color(0xff1e0e33) ? const Color(0xff1e0e33),
                  minWidth: 370,
                  height: 60,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    (() {
                      if (isEnded == true) {
                        return "FINISH";
                      }
                      if (isStarted) {
                        return "START";
                      }
                      if (!isStarted) {
                        return "STOP";
                      }
                    })(),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 26,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snap) {
                final value = snap.data;
                final displayTime = StopWatchTimer.getDisplayTime(
                  value,
                  hours: false,
                  minute: true,
                  milliSecond: false,
                  second: true,
                );
                return SizedBox(
                  child: Container(
                    width: 328,
                    height: 173,
                    margin: EdgeInsets.only(top: 380, left: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.0),
                      color: middleBoxColor,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      displayTime,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 67,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
