import 'package:intl/intl.dart';
import 'globalHandler.dart';

class Time {
  late GlobalHandler handler;

  Time() {
    handler = GlobalHandler();
  }
  // ignore: non_constant_identifier_names
  Future<String> GetTime() async {
    try {
      var time = await handler.getTime();
      return time.toString();
    } catch (e) {
      print("Problem: $e");
      DateTime now = new DateTime.now();
      String formattedTime = DateFormat.jm().format(now);
      return formattedTime;
    }
  }

  String habitTimeSetter(newTime) {
    DateTime now = new DateTime.now();
    DateTime newNow = now.subtract(new Duration(minutes: newTime));
    String formattedTime = DateFormat.jm().format(newNow);

    /// Send this to Shared Preferences
    handler.setTime(formattedTime); // @current_time is the variable
    // Returning to main scene
    return formattedTime;
  }

  String moodNeutral(newTime) {
    DateTime now = new DateTime.now();
    DateTime newNow = now.add(new Duration(minutes: newTime));
    String formattedTime = DateFormat.jm().format(newNow);

    /// Send this to Shared Preferences
    handler.setTime(formattedTime); // @current_time is the variable
    // Returning to main scene
    return formattedTime;
  }

  String moodBad(newTime) {
    DateTime now = new DateTime.now();
    DateTime newNow = now.add(new Duration(minutes: newTime));
    String formattedTime = DateFormat.jm().format(newNow);

    /// Send this to Shared Preferences
    handler.setTime(formattedTime); // @current_time is the variable
    // Returning to main scene
    return formattedTime;
  }
}

class Date {
  late GlobalHandler handler;

  Date() {
    handler = GlobalHandler();
  }
  // ignore: non_constant_identifier_names
  Future<String> GetDate() async {
    try {
      var date = await handler.getDate();
      // if (date.toString() == null || date.toString() == "") {
      //   // Make a dateTime

      //   handler.setDate();
      // }
      return date.toString();
    } catch (e) {
      print("Problem: $e");
      DateTime now = new DateTime.now();
      String formattedDate = DateFormat.jm().format(now);
      return formattedDate;
    }
  }

  // String habitTimeSetter(newTime) {
  //   DateTime now = new DateTime.now();
  //   DateTime newNow = now.subtract(new Duration(minutes: newTime));
  //   String formattedTime = DateFormat.jm().format(newNow);

  //   /// Send this to Shared Preferences
  //   handler.setTime(formattedTime); // @current_time is the variable
  //   // Returning to main scene
  //   return formattedTime;
  // }

  // String moodNeutral(newTime) {
  //   DateTime now = new DateTime.now();
  //   DateTime newNow = now.add(new Duration(minutes: newTime));
  //   String formattedTime = DateFormat.jm().format(newNow);

  //   /// Send this to Shared Preferences
  //   handler.setTime(formattedTime); // @current_time is the variable
  //   // Returning to main scene
  //   return formattedTime;
  // }

  // String moodBad(newTime) {
  //   DateTime now = new DateTime.now();
  //   DateTime newNow = now.add(new Duration(minutes: newTime));
  //   String formattedTime = DateFormat.jm().format(newNow);

  //   /// Send this to Shared Preferences
  //   handler.setTime(formattedTime); // @current_time is the variable
  //   // Returning to main scene
  //   return formattedTime;
  // }
}
