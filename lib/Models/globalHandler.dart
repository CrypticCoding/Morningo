import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:morningo/components/MorningStarPopup.dart';
import 'package:morningo/components/todoGenerator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalHandler {
  void setDate(date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('@current_date', date);
  }

  // ignore: missing_return
  Future<String?> getDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    String? date = await prefs.getString('@current_date');
    return date;
  }

  // TIME --
  void setTime(time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('@current_time', time);
  }

  // ignore: missing_return
  Future<String?> getTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    String? time = await prefs.getString('@current_time');
    return time;
  }
}

class GlobalDateHandler {
  // Yesterday : calculateDifference(date) == -1.
  // Today : calculateDifference(date) == 0.
  // Tomorrow : calculateDifference(date) == 1.
  int calculateDifference(String dateString) {
    DateTime date = DateTime.parse(dateString);
    var formatter = new DateFormat('yyyy-MM-dd');
    formatter.format(date);
    DateTime now = DateTime.now();

    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }
}

class GlobalMorningStarHandler {
  static int globalMorningStar = 0;
  static int incrementMorningStar = 100;

  Future<void> intialMorningStar(startCount) async {
    // Random Number from 1-100 * random.Range(); * depending on when they woke up
    // get the time   right now
    // get the time before
    // Compare two times
    // the more distance the better (need a system asap)
    //int count = globalMorningStar + startCount;
    //globalMorningStar = count;
    setMorningStar(1);
  }

  Future<void> setMorningStar(startCount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    var mornStar = prefs.getInt('@morning_star') ?? 0;
    // // Star Count Randomization
    // var startCountRandom = Random().nextInt(startCount) + 1;
    // startCount = startCountRandom.floor();
    globalMorningStar = mornStar + startCount as int;
    // globalMorningStar = 0;
    prefs.setInt('@morning_star', globalMorningStar);

    // Calling Morning Star Pop Up
  }

  // Call this from HomePage
  Future<void> setGlobalMorningStarConstant(mornCount) async {
    incrementMorningStar = mornCount;
    // when someone wakes up before
  }

  // ignore: missing_return
  Future<int?> getMorningStar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    int? mornStar = await prefs.getInt('@morning_star');
    return mornStar;
  }

  Future<void> callMorningStar(context) async {
    if (TodoController().getAllTodoLenght() == 0) {
      //check ~ ses hoise naki
      //rint("WORKED!");
      setMorningStar(100);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return MorningPopUp().openPopup(context, 100);
        },
      );
    }
  }
}
