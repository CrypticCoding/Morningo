class InfoGateherer {
  String name = "";
  int age = 0;
  // ignore: non_constant_identifier_names
  int average_fall_asleep_time = 0;
  String sleepTime = "";
  // ignore: non_constant_identifier_names
  String average_wake_up_time = "";

  InfoGateherer(
      [String name,
      int age,
      String averageFallTime,
      String sleepTime,
      String averageWakeUpTime]) {
    this.name = name;
    this.age = age;
    this.average_fall_asleep_time = average_fall_asleep_time;
    this.sleepTime = sleepTime;
    this.average_wake_up_time = average_wake_up_time;
  }

  // ignore: non_constant_identifier_names

  String getName() {
    return name;
  }

  String getAll() {
    String allCollection =
        "$name:$age:$average_fall_asleep_time:$sleepTime:$average_wake_up_time";
    return allCollection;
  }
}
