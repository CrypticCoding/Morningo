import 'package:shared_preferences/shared_preferences.dart';

class GlobalHandler {
  void setTime(time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('@current_time', time);
  }

  // ignore: missing_return
  Future<String> getTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    String time = await prefs.getString('@current_time');
    return time;
  }
}
