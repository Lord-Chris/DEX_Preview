class IdUtils {
  static int generateId() {
    final now = DateTime.now();
    return (now.millisecondsSinceEpoch -
        DateTime(now.year, now.month, now.day).millisecondsSinceEpoch);
  }
}
