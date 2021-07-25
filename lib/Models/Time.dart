import 'package:intl/intl.dart';
import 'globalHandler.dart';

class Time {
  GlobalHandler handler;

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
