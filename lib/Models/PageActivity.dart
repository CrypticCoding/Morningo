// Create a Map Of Elements
// var activities = {
//    "Excercise": 0,
//    "Meditation": 0,
//  };
// when calling the function append to an Empty Map,
// Send that thing to SharedPreferences
// Read that using Map
// Map<Class, dynamic> should take Class and an dynamic type
import 'package:shared_preferences/shared_preferences.dart';

class PageActivity {
  Map<String, dynamic> activities = {};

  // ignore: missing_return
  Future<int> countTimes() async {}
  void addActivity(String activityName, dynamic activityAmount) {
    activities[activityName] = activityAmount;
    setActivity(activityName, activityAmount);
  }

  void deleteActivity(String activityName) {
    activities.remove(activityName);
  }

  void changeActivityAmount(String activityName, dynamic activityAmount) {
    activities[activityName] = activityAmount;
  }

  // BackEnd Load & Reload
  void setActivity(String activityName, dynamic activityAmount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    activities[activityName] = activityAmount;
    await prefs.setString('@$activityName', activityAmount.toString());
  }

  void removeActivity(String activityName, dynamic activityAmount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(activityName.toString());
  }

  // ignore: missing_return
  Future<String> getActivity(String activityName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    String activity = await prefs.getString('@$activityName');
    return activity;
  }

  Future<void> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
