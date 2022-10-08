import 'package:morningo/Models/globalHandler.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String>? collection = [];

// TODO: Get Information All; What brings you Morningo,
// Time he wants to wake up, Time he gets to Sleep,
// What Habits he wants in his Routine
// MAYBE: Add Firebase Connection, so we can access them outside.
// TODO: UNDERSTAND THE BOTTOM COMMENTS WISELY!

// morning_habits -- for Morning Habits
// bringHere -- for reasons to Join!

class OnboardController {
  GlobalHandler? handler;
  //
  Future<List<String>?> getCollection(nameOfCollection) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    collection = await prefs.getStringList("$nameOfCollection");
    // print(collection.toString());
    return collection;
  }

  void setCollection(nameOfCollection, List<String?> valueOfCollection) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('$nameOfCollection', valueOfCollection as List<String>);
  }
}
