class CareType {
  String _name = "";
  int _frequency = 0;
  int _frequencyIndex = 0;
  int _timeIndex = 0;
  bool _enabled = false;
  DateTime? _lastCare = null;
  DateTime? _nextCare = null;
  // bool test = false;

  void setCareTime(DateTime date) {
    _lastCare = date;
  }

  void updateNextCareTime() {
    // if (test) {
    _nextCare = _lastCare?.add(Duration(days: _frequency));
    // test = false;
    // } else {
    // _nextCare = _lastCare?.add(Duration(days: _frequency - 1));
    // test = true;
    // }
  }

  int? getDaysUntilNextCare() {
    return _nextCare
        ?.difference(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day))
        .inDays
        .toInt();
  }

  bool careNeeded() {
    // if ((DateTime.now().year == _nextCare?.year) &&
    //     (DateTime.now().month == _nextCare?.month) &&
    //     (DateTime.now().day == _nextCare?.day)) {
    //   return true;
    // }
    if (_nextCare
            ?.difference(DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day))
            .inDays
            .toInt() ==
        0) {
      return true;
    }
    return false;
  }

  CareType(String name) {
    _name = name;
  }

  String getName() {
    return _name;
  }

  void setName(String name) {
    _name = name;
  }

  bool getEnabled() {
    return _enabled;
  }

  void setEnabled(bool value) {
    _enabled = value;
  }

  int getFrequency() {
    return _frequency;
  }

  void setFrequency(int frequency) {
    _frequency = frequency;
  }

  int getFrequencyIndex() {
    return _frequencyIndex;
  }

  void setFrequencyIndex(int index) {
    _frequencyIndex = index;
  }

  int getTimeIndex() {
    return _timeIndex;
  }

  void setTimeIndex(int index) {
    _timeIndex = index;
  }
}
