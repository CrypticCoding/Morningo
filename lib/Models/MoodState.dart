class MoodState {
  bool good;
  bool neutral;
  bool bad;

  MoodState(bool good, bool neutral, bool bad) {
    this.good = good;
    this.neutral = neutral;
    this.bad = bad;

    print("Good: $good");
    print("Neutral: $neutral");
    print("Bad: $bad");
  }
}
