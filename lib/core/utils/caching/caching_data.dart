class Cache<T> {
  T? data;
  DateTime? timeStamp;

  bool isValid(int durationInSeconds) {
    if (data == null || timeStamp == null) {
      return false;
    }
    return DateTime.now().difference(timeStamp!).inSeconds < durationInSeconds;
  }

  void update(T newData, DateTime newTimeStamp) {
    data = newData;
    timeStamp = newTimeStamp;
  }
}
